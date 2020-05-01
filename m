Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9419E1C0C87
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 05:21:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CyFv0YT8zDr3P
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 13:21:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=sweettea@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZJKCu/Cm; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZJKCu/Cm; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CxC83RmjzDqD8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 12:33:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588300424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WoEKQ4lWoOTrBQAr9fSIywvhXH2CJ/MfFxWkNiilf98=;
 b=ZJKCu/CmsK/6FisRxgFiLPGjtyCgkcVd1sf1yF6ECXuNLS+9e33VvGVIszgYGBOyNgKbcS
 1GeA6J8U09WvrJWPFn/X9IbL9oOshKcwYMfHEXfYX3Cg35RiLLxiUGzSSUYNFBrkpi5N4V
 f3KpKSXT9U5kpKT1QuXnJFp5ClySC6A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588300424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WoEKQ4lWoOTrBQAr9fSIywvhXH2CJ/MfFxWkNiilf98=;
 b=ZJKCu/CmsK/6FisRxgFiLPGjtyCgkcVd1sf1yF6ECXuNLS+9e33VvGVIszgYGBOyNgKbcS
 1GeA6J8U09WvrJWPFn/X9IbL9oOshKcwYMfHEXfYX3Cg35RiLLxiUGzSSUYNFBrkpi5N4V
 f3KpKSXT9U5kpKT1QuXnJFp5ClySC6A=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-y_LPwF4QMKyVd7rnepb7FQ-1; Thu, 30 Apr 2020 22:33:40 -0400
X-MC-Unique: y_LPwF4QMKyVd7rnepb7FQ-1
Received: by mail-vk1-f198.google.com with SMTP id w25so4125188vkm.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 19:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FmTXwQDIMo+IjpBIspuTIpC6trFCfV96jFy7feBDa3U=;
 b=VCuh0/clZvGl82L1EoYFq2fFlziRmHP8PczgvsLKwK4cp/KtigzJXO0yBJhebruR9n
 Qje8frsZwXLOOUBarzNI7fdCRgKm9bUO7PPQ81Objcq4Y1Adg583oMcH/BzrBYsk35At
 a29HUWujzCkuGAb+yfolKplgJPObLpIlBtLHUtYsBTzbPWMJ8i85Wmrj9D9l8iAt++Ct
 aQZ0WKUj7Y2d8z3gTa0nBl+iHYGgmj1n4i7Q7if7o3+oFeQQ+ZBMNieY4slPcFuvriAI
 lCYrNlIXZe0e8GVMbFda7L7kF6I2sqgjwyvZSWuuPdnlKu7X1/G5NNAqYxPJA+PMQccq
 wyyQ==
X-Gm-Message-State: AGi0PubODtltkoyi+KA17BQ7ZiC5WjkSVer42NUkvtCxTj396mwznn/g
 ftNegwrG+47dnM6PMd7d1K9/q8Mc7TYsdP+YQRDqUSLPc/xEtIvAvTLmpm7bY++BbCb06wUL+6G
 y12fOaSxVi97UxttpKnlxcHxqq6RaSAOSHHd+FYhGiw==
X-Received: by 2002:a1f:4106:: with SMTP id o6mr1255015vka.52.1588300419602;
 Thu, 30 Apr 2020 19:33:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzJZChxr1bIOT3BrCLUuQh+Ikon7C/tnK/FqweuMnIX4otnNYFiYRZlgH/GIaMCFHcKeYabPii/TDhlHZceM8=
X-Received: by 2002:a1f:4106:: with SMTP id o6mr1254987vka.52.1588300419383;
 Thu, 30 Apr 2020 19:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200414131348.444715-1-hch@lst.de>
 <20200414131348.444715-22-hch@lst.de>
 <20200414151344.zgt2pnq7cjq2bgv6@debian>
In-Reply-To: <20200414151344.zgt2pnq7cjq2bgv6@debian>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 30 Apr 2020 22:33:28 -0400
Message-ID: <CAMeeMh8Q3Od76WaTasw+BpYVF58P-HQMaiFKHxXbZ_Q3tQPZ=A@mail.gmail.com>
Subject: Re: [PATCH 21/29] mm: remove the pgprot argument to __vmalloc
To: Wei Liu <wei.liu@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004b5c5705a48d02f1"
X-Mailman-Approved-At: Fri, 01 May 2020 13:16:54 +1000
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 linux-mm@kvack.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Christoph Hellwig <hch@lst.de>,
 Peter Zijlstra <peterz@infradead.org>, Gao Xiang <xiang@kernel.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000004b5c5705a48d02f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings;

I recently noticed this change via the linux-next tree.

It may not be possible to edit at this late date, but the change
description refers to PROT_KERNEL, which is a symbol which does not appear
to exist; perhaps PAGE_KERNEL was meant? The mismatch caused me and a
couple other folks some confusion briefly until we decided it was supposed
to be PAGE_KERNEL; if it's not too late, editing the description to clarify
so would be nice.

Many thanks.

John Dorminy



On Tue, Apr 14, 2020 at 11:15 AM Wei Liu <wei.liu@kernel.org> wrote:

> On Tue, Apr 14, 2020 at 03:13:40PM +0200, Christoph Hellwig wrote:
> > The pgprot argument to __vmalloc is always PROT_KERNEL now, so remove
> > it.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Michael Kelley <mikelley@microsoft.com> [hyperv]
> > Acked-by: Gao Xiang <xiang@kernel.org> [erofs]
> > Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  arch/x86/hyperv/hv_init.c              |  3 +--
> [...]
> >
> > diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
> > index 5a4b363ba67b..a3d689dfc745 100644
> > --- a/arch/x86/hyperv/hv_init.c
> > +++ b/arch/x86/hyperv/hv_init.c
> > @@ -95,8 +95,7 @@ static int hv_cpu_init(unsigned int cpu)
> >        * not be stopped in the case of CPU offlining and the VM will
> hang.
> >        */
> >       if (!*hvp) {
> > -             *hvp =3D __vmalloc(PAGE_SIZE, GFP_KERNEL | __GFP_ZERO,
> > -                              PAGE_KERNEL);
> > +             *hvp =3D __vmalloc(PAGE_SIZE, GFP_KERNEL | __GFP_ZERO);
> >       }
>
> Acked-by: Wei Liu <wei.liu@kernel.org>
>
>

--0000000000004b5c5705a48d02f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Greetings;<br><br></div><div>I recently noticed this =
change via the linux-next tree.</div><div><br></div><div>It may not be poss=
ible to edit at this late date, but the change description refers to PROT_K=
ERNEL, which is a symbol which does not appear to exist; perhaps PAGE_KERNE=
L was meant? The mismatch caused me and a couple other folks some confusion=
 briefly until we decided it was supposed to be PAGE_KERNEL; if it&#39;s no=
t too late, editing the description to clarify so would be nice.<br><br></d=
iv><div>Many thanks.<br><br></div><div>John Dorminy<br></div><div><br><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Apr 14, 2020 at 11:15 AM Wei Liu &lt;<a href=3D"mailto:wei.liu=
@kernel.org">wei.liu@kernel.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Apr 14, 2020 at 03:13:40PM +0200, =
Christoph Hellwig wrote:<br>
&gt; The pgprot argument to __vmalloc is always PROT_KERNEL now, so remove<=
br>
&gt; it.<br>
&gt; <br>
&gt; Signed-off-by: Christoph Hellwig &lt;<a href=3D"mailto:hch@lst.de" tar=
get=3D"_blank">hch@lst.de</a>&gt;<br>
&gt; Reviewed-by: Michael Kelley &lt;<a href=3D"mailto:mikelley@microsoft.c=
om" target=3D"_blank">mikelley@microsoft.com</a>&gt; [hyperv]<br>
&gt; Acked-by: Gao Xiang &lt;<a href=3D"mailto:xiang@kernel.org" target=3D"=
_blank">xiang@kernel.org</a>&gt; [erofs]<br>
&gt; Acked-by: Peter Zijlstra (Intel) &lt;<a href=3D"mailto:peterz@infradea=
d.org" target=3D"_blank">peterz@infradead.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 arch/x86/hyperv/hv_init.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 3 +--<br>
[...]<br>
&gt; <br>
&gt; diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c<br>
&gt; index 5a4b363ba67b..a3d689dfc745 100644<br>
&gt; --- a/arch/x86/hyperv/hv_init.c<br>
&gt; +++ b/arch/x86/hyperv/hv_init.c<br>
&gt; @@ -95,8 +95,7 @@ static int hv_cpu_init(unsigned int cpu)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * not be stopped in the case of CPU offlini=
ng and the VM will hang.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*hvp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*hvp =3D __vmalloc(PA=
GE_SIZE, GFP_KERNEL | __GFP_ZERO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PAGE_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*hvp =3D __vmalloc(PA=
GE_SIZE, GFP_KERNEL | __GFP_ZERO);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Acked-by: Wei Liu &lt;<a href=3D"mailto:wei.liu@kernel.org" target=3D"_blan=
k">wei.liu@kernel.org</a>&gt;<br>
<br>
</blockquote></div>

--0000000000004b5c5705a48d02f1--

