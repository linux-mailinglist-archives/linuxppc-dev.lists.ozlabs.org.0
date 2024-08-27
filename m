Return-Path: <linuxppc-dev+bounces-595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EC9960510
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 11:02:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtM4Z1ylsz2yV3;
	Tue, 27 Aug 2024 19:02:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724749342;
	cv=none; b=cP3/zXL4N2v2oZTMJzUiPzDbX4wOseEXm3OI/9HkBLYT9fHbwfcXXzukOF6iqRKsOiVdStsQsw/GqwYmzvvGny6EXPASQLeHyKn4MLGy1KwsKXuZjSkCn/5s4bKzfQqqdg+TI+Ldlv+R/xEcEIarLmOx1gs8nGqrfFh2h7eXEBX8lXfh3iBhzibp+FLAk7Jq56NasKSWZSVbZ5ufDvSzj29xVKhhPu5gQqRAvkquNlomiEFB/KW05iivKBQH4/4BlYzQJLVflY0uUpQ0Pta16Mthmso+edh9LZfiuML8DxCjdZ0+1T2c6vOEx+durpusUCCQ8aIYZhkORgJukYzYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724749342; c=relaxed/relaxed;
	bh=outpxqXc6KM2Oo4/0nqD4smTGWGwDj3DOJrNewpgErA=;
	h=DKIM-Signature:DKIM-Signature:Received:X-MC-Unique:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Scanned-By; b=cd8Et8x0i4ER1uvte5S04hWACDi9dhjza4V9vo7NQTb9+K/4k1wLwSYyuj9w4hwN/pz5+XGKpfHPDtAYwQJ5uxLUynS5e/nZEQmQD35jf9A2NpBRrdAWx2ObVEpQt1wA/AaOYhEWvivdemwDtqLFBOS2DxzouG5iQQjfP30yjGYJxc9wEgPA39RsfXcZj+4xgVnzGdKKhyUnbry9NMMlOhl68ZhXKRxgmNfTts+C50VcVyXCaI9dni+xHtG0Hr5aRRoM+b5d09p04oI3G45sgCFRsxRHdwCVPVn9VfqeVCewxNR2lHSBaOQV9A4xK/IvA+tMwXKhF3zzN647NV9dwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N1Wkvdzz; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WLtO8reA; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N1Wkvdzz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WLtO8reA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtM4Y5QsRz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 19:02:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724749333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=outpxqXc6KM2Oo4/0nqD4smTGWGwDj3DOJrNewpgErA=;
	b=N1WkvdzzDZOd8IDkWCvREPDSBaLOj59fzHV5vSPtoY9WDifl8tFHdmq8DDRnqE0d+khI1Z
	NWXAwpTCTMgtGgKf3CrkTjIMFYT/rqfGYhDgTi5Qt4/0P5s29TBJPvVvq2HuRgD/EhrJcp
	8/owWw3xyzI5VwFEpwRSzCikIwTAVno=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724749334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=outpxqXc6KM2Oo4/0nqD4smTGWGwDj3DOJrNewpgErA=;
	b=WLtO8reAD9dI6vjKb8G/CJYbIty+JwlRynkohZgoD1AjZV89wKlPryQLXYN+U+uhvelRFr
	a1f8rICZ3pVBHr4WMqiTlbZrL2yazim1i3dp1jziUOUaJ5Ie3eB3zf0D80oFW63oNbJF7K
	+qiOzlqkVnGh0ay8CDtr3wWtJV50fzk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-rv4ABExJM5egEclpNPuyLA-1; Tue,
 27 Aug 2024 05:02:08 -0400
X-MC-Unique: rv4ABExJM5egEclpNPuyLA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B6471955BFE;
	Tue, 27 Aug 2024 09:02:05 +0000 (UTC)
Received: from localhost (unknown [10.72.112.42])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 416C019560AA;
	Tue, 27 Aug 2024 09:02:02 +0000 (UTC)
Date: Tue, 27 Aug 2024 17:01:58 +0800
From: Baoquan He <bhe@redhat.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Dave Vasilevsky <dave@vasilevsky.ca>, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, mpe@ellerman.id.au,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	Reimar =?iso-8859-1?Q?D=F6ffinger?= <Reimar.Doeffinger@gmx.de>
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
Message-ID: <Zs2WBgtADYxzVMyt@MiWiFi-R3L-srv>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
 <CAMuHMdVYNhFJ+qBDP3_fi9oeHsgOL0vqPe1YqE18+M8n1onssw@mail.gmail.com>
 <09c29a3c4879d4ce5d8b97fd60d8ba5e38bed979.camel@physik.fu-berlin.de>
 <Zs1wpHxfTcwKr517@MiWiFi-R3L-srv>
 <f355e26eead641f5f281372aadf9dee7de19a4c7.camel@physik.fu-berlin.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f355e26eead641f5f281372aadf9dee7de19a4c7.camel@physik.fu-berlin.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 08/27/24 at 08:37am, John Paul Adrian Glaubitz wrote:
> On Tue, 2024-08-27 at 14:22 +0800, Baoquan He wrote:
> > About why it's enabled by default, as Michael has explained in another
> > thread, distros usualy needs to enable it by default because vmcore
> > dumping is a very important feature on servers, even guest instances. 
> > Even though kdump codes are enabled to built in, not providing
> > crashkernel= value won't make vmcore dumping take effect, it won't cost
> > system resources in that case.
> 
> OK, thanks for the explanation. But as we have found out in the mean time,
> the assumption was wrong to enable it by default for all architectures as
> some architectures cannot boot a crash dump kernel with their default bootloader
> but only through kexec.
> 
> Can we have a follow-up patch to disable crash dump kernels where they're
> not needed? I mean, not every platform supported by Linux is obviously a
> x86-based or POWER-based server.

Yes, while isn't Dave's patch a good one to fix it? In Dave's patch, the
default enabling of CRASH_DUMP has been taken off, change to rely on
ARCH_DEFAULT_CRASH_DUMP provided by each arch.

 config CRASH_DUMP
        bool "kernel crash dumps"
-       default y
+       default ARCH_DEFAULT_CRASH_DUMP


