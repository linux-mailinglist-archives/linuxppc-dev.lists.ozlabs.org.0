Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0E286133
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 16:26:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5xTj16N9zDqQF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 01:26:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=cai@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=M409mRzb; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=M409mRzb; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5xQG65mZzDqCT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 01:23:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602080595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arCJetUQyffSDjg12W9Bfh+TxnVKzaBR2KG2Ej+1vzg=;
 b=M409mRzb628uzZ68SsN2J1PL6ufzCjZ2rxed2sN6wd114fgGqxO7Era09Z6K/cRY/ta2Nc
 28y1OeIBnmYYVjSRCwiXA3VDwZ3NNJTZkbBGUh7I6NxO1p3DXLYUevJ6OzgU4S2wS3lSfo
 FtJTTa95e8OgZUmNYyAmUspoOAlgNlE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602080595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arCJetUQyffSDjg12W9Bfh+TxnVKzaBR2KG2Ej+1vzg=;
 b=M409mRzb628uzZ68SsN2J1PL6ufzCjZ2rxed2sN6wd114fgGqxO7Era09Z6K/cRY/ta2Nc
 28y1OeIBnmYYVjSRCwiXA3VDwZ3NNJTZkbBGUh7I6NxO1p3DXLYUevJ6OzgU4S2wS3lSfo
 FtJTTa95e8OgZUmNYyAmUspoOAlgNlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-yazGlPxIPsy3s1B2I8T-qg-1; Wed, 07 Oct 2020 10:23:11 -0400
X-MC-Unique: yazGlPxIPsy3s1B2I8T-qg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DD8E10857E8;
 Wed,  7 Oct 2020 14:23:09 +0000 (UTC)
Received: from ovpn-66-246.rdu2.redhat.com (ovpn-66-246.rdu2.redhat.com
 [10.10.66.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51433757DF;
 Wed,  7 Oct 2020 14:23:04 +0000 (UTC)
Message-ID: <a52f0536059b795c0841c2ae0c65a607f2ce558a.camel@redhat.com>
Subject: Re: [PATCH v2 09/11] powerpc/smp: Optimize update_mask_by_l2
From: Qian Cai <cai@redhat.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Date: Wed, 07 Oct 2020 10:23:03 -0400
In-Reply-To: <20201007141745.GM12031@linux.vnet.ibm.com>
References: <20200921095653.9701-1-srikar@linux.vnet.ibm.com>
 <20200921095653.9701-10-srikar@linux.vnet.ibm.com>
 <f848a6761de05d655d847130e77b23b2bb39aa26.camel@redhat.com>
 <20201007141745.GM12031@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-10-07 at 19:47 +0530, Srikar Dronamraju wrote:
> Can you confirm if CONFIG_CPUMASK_OFFSTACK is enabled in your config?

Yes, https://gitlab.com/cailca/linux-mm/-/blob/master/powerpc.config

We tested here almost daily on linux-next.

