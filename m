Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 006012CE040
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 21:59:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cn7Vt6D0mzDrGx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 07:59:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=qcai@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=HSeStVWg; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=HSeStVWg; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn2vb1fP0zDqCc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 04:31:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607016711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uhjOmS8Z+yxBhHtN/Pb/4wPsobRIoffiC4vM6dftZ0=;
 b=HSeStVWgCzwqFzBd9xKklZv8rS/AJHN3bQ1CmnB/EtZT9MK8pbEY19Gcx1PKhR4opoYTh7
 udSo+GcT5QtD2i0JkH+Yay1K5CCE5EPzrEVafLodSmCxEMi269euniAtQdtGyKJnKVUhti
 Gz0XbFk42CM7zde/KhJgZxoMuH/o3rc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607016711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uhjOmS8Z+yxBhHtN/Pb/4wPsobRIoffiC4vM6dftZ0=;
 b=HSeStVWgCzwqFzBd9xKklZv8rS/AJHN3bQ1CmnB/EtZT9MK8pbEY19Gcx1PKhR4opoYTh7
 udSo+GcT5QtD2i0JkH+Yay1K5CCE5EPzrEVafLodSmCxEMi269euniAtQdtGyKJnKVUhti
 Gz0XbFk42CM7zde/KhJgZxoMuH/o3rc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-uay9NePCNpafdACGdNGn2A-1; Thu, 03 Dec 2020 12:31:49 -0500
X-MC-Unique: uay9NePCNpafdACGdNGn2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ED24802B47;
 Thu,  3 Dec 2020 17:31:48 +0000 (UTC)
Received: from ovpn-66-132.rdu2.redhat.com (unknown [10.10.67.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6007D18A60;
 Thu,  3 Dec 2020 17:31:47 +0000 (UTC)
Message-ID: <ec6d00dee24010436eb0fd3f85c734e31ede1b7d.camel@redhat.com>
Subject: Re: [PATCH 3/7] powerpc/64s: flush L1D after user accesses
From: Qian Cai <qcai@redhat.com>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 03 Dec 2020 12:31:46 -0500
In-Reply-To: <e82f315e08fe9f13ce4e94259968e0782ebb57a3.camel@redhat.com>
References: <20201119231333.361771-1-dja@axtens.net>
 <20201119231333.361771-4-dja@axtens.net>
 <e82f315e08fe9f13ce4e94259968e0782ebb57a3.camel@redhat.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=qcai@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 04 Dec 2020 07:56:02 +1100
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
Cc: cmr@informatik.wtf, spoorts2@in.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-12-03 at 12:17 -0500, Qian Cai wrote:
> A simple "echo t > /proc/sysrq-trigger" will trigger this warning almost
> endlessly on Power8 NV.

Correction -- POWER9 NV.

