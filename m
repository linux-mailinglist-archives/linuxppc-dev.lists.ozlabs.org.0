Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A84E723395A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 21:52:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHh0G3PxHzDrBy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 05:52:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=EaAXsrUr; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WX9FICYf; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHgyQ59DqzDrBf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 05:51:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596138664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xR/gVAeuimxErZha5G/Neri0uTmAQhj3WsbxtwQPPUU=;
 b=EaAXsrUrmSVinLkR3Wqw4rOyF4P4zoaQVhRu3XUizcDQly8VjOrua5ufywOW956v8TWz9+
 Sk16R3IrkJb8OFGf7xYKTllUpT1604hI5sjAkHt/vgZXZDdSwjElyn3tyfwTsqzfCmpBn2
 GPD3O8n+9furXomPsNgnCygiTeMgbEs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596138665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xR/gVAeuimxErZha5G/Neri0uTmAQhj3WsbxtwQPPUU=;
 b=WX9FICYf8i1+TtR4Q8RIknUXpcxpu2SN8LmvI5pQKNk1lHMv+R4Wfq0vFP5/i/wAUw0m6A
 hGxduMeir3xEZOLPTdTAdZ1iGvVI/uq+Zn5DRra3Fs3Bpg/YTe6BrQt6gI1LgRSNHtwwHY
 ZUxWlHRDJ8o6xzZpaqYNIDEeEcAdmgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-tczUciwSMbqRbGkxzWmkeg-1; Thu, 30 Jul 2020 15:50:53 -0400
X-MC-Unique: tczUciwSMbqRbGkxzWmkeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B430107BEFD;
 Thu, 30 Jul 2020 19:50:51 +0000 (UTC)
Received: from krava (unknown [10.40.194.223])
 by smtp.corp.redhat.com (Postfix) with SMTP id 5C4A71001281;
 Thu, 30 Jul 2020 19:50:49 +0000 (UTC)
Date: Thu, 30 Jul 2020 21:50:48 +0200
From: Jiri Olsa <jolsa@redhat.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V5 0/4] powerpc/perf: Add support for perf extended regs
 in powerpc
Message-ID: <20200730195048.GA1484375@krava>
References: <1595870184-1460-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <27D1CE26-A506-4CFF-B1C2-E0545F26E637@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <27D1CE26-A506-4CFF-B1C2-E0545F26E637@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Michael Neuling <mikey@neuling.org>, maddy@linux.vnet.ibm.com,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 kjain@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 30, 2020 at 01:24:40PM +0530, Athira Rajeev wrote:
> 
> 
> > On 27-Jul-2020, at 10:46 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> wrote:
> > 
> > Patch set to add support for perf extended register capability in
> > powerpc. The capability flag PERF_PMU_CAP_EXTENDED_REGS, is used to
> > indicate the PMU which support extended registers. The generic code
> > define the mask of extended registers as 0 for non supported architectures.
> > 
> > Patches 1 and 2 are the kernel side changes needed to include
> > base support for extended regs in powerpc and in power10.
> > Patches 3 and 4 are the perf tools side changes needed to support the
> > extended registers.
> > 
> 
> Hi Arnaldo, Jiri
> 
> please let me know if you have any comments/suggestions on this patch series to add support for perf extended regs.

hi,
can't really tell for powerpc, but in general
perf tool changes look ok

jirka

