Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC7F359427
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 06:49:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGlzK1q5Nz3bTC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 14:49:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dBL7I7dK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233;
 helo=mail-lj1-x233.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dBL7I7dK; dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGltM2K2Qz2xff
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 14:45:14 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id c6so4896091lji.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 21:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7PmcJr1wFNW3/YvIpJr9LvNoO8wwpSkZFDRqZ4TXlDw=;
 b=dBL7I7dK+a2MCjt6+Is5uTqA05WbpHG3jx0XSpL6BzWZV99c9q4oHC539oK+6/kpgW
 t27oYymwJsE7In4Cru7IT/gR1W6DoUHhXU1d5qDDpgLu/mKn/E9GafqQTjlJIL2NYmIJ
 0zSjjPOEus/yxmcSyoGHxeR+zNH//QV2ZSwMpR/u0Mmgw28tjiyT9PFmR2n6izBApDSd
 SwOtdwnoPz5BPJ1fxTybC9BhhpzSXZtx+f636crOfa0MAXPi6HM8PhcA+H6xXzttavym
 4hrr1z5xrN7VEUB/rjCUeYso86VClr6eYXJmaVqTTcApt6eOBMjigS8T6Ncb8hb2d9Bz
 YTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7PmcJr1wFNW3/YvIpJr9LvNoO8wwpSkZFDRqZ4TXlDw=;
 b=ZIHF3kFabcI5248fUa0CvVc7c1/OfgUG1Ob7v5TbDP2ietfZd0aVodooNiMgdQ6O/o
 31DRPh1GpSvqIuf4JjR8OWHtdEVGmXw5PjSj+qMim/HgNgR3hntX+OoT3VfJGSQImks+
 o+SatupmCaW9bi4HV8uI7TTDAwi8R+ciShj5rgsgRtK4sfyed+GleYua+0JfCRjU2c6l
 gEJFuqyLSX+xNtlrXkrpS9S6B1XE4bYkYXS1z/V1PrHGMqJozReBVNeSwisGEZWwAcrv
 3UM13fcF23cZRDt3u9QzNqzK8irslAdVOYOOeuJuYR207zRoQU0K+seUEOv8dArX1uKI
 eTYQ==
X-Gm-Message-State: AOAM530+/Bop1zJq7HdLyM2QmFKukcnBIPWpWAnPUa8b1eFI5IDfD2SW
 aAOcxwQD9DKGTBLb2+neBoUNu9vx6xyM2JFWnp4=
X-Google-Smtp-Source: ABdhPJwTZCOScLIcDgr/d8qSPxT2EVtnneAsA3MWLUW6nvs8nVu+ik4Wm1wdSm7vWONzXkVTRzNsc5fKUWc+OVQJPc0=
X-Received: by 2002:a2e:b88f:: with SMTP id r15mr8098544ljp.432.1617943505534; 
 Thu, 08 Apr 2021 21:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210407195613.131140-1-leobras.c@gmail.com>
 <87im4xe3pk.fsf@mpe.ellerman.id.au>
 <8e1ce7e9-415b-92ea-0437-a4331ed3c7f9@ozlabs.ru>
 <87ft01du50.fsf@mpe.ellerman.id.au>
 <21407a96-5b20-3fae-f1c8-895973b655ef@ozlabs.ru>
In-Reply-To: <21407a96-5b20-3fae-f1c8-895973b655ef@ozlabs.ru>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Fri, 9 Apr 2021 01:44:54 -0300
Message-ID: <CADvQ+rGq8-gp6vf1QLgKCWTVHjX7O1EuKo8gciXeKv5z9UkiOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes
 present in LoPAR
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: multipart/alternative; boundary="000000000000ea01ca05bf82d348"
X-Mailman-Approved-At: Fri, 09 Apr 2021 14:49:10 +1000
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Brian King <brking@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000ea01ca05bf82d348
Content-Type: text/plain; charset="UTF-8"

Em sex., 9 de abr. de 2021 01:36, Alexey Kardashevskiy <aik@ozlabs.ru>
escreveu:

>
>
> On 08/04/2021 19:04, Michael Ellerman wrote:
> > Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> >> On 08/04/2021 15:37, Michael Ellerman wrote:
> >>> Leonardo Bras <leobras.c@gmail.com> writes:
> >>>> According to LoPAR, ibm,query-pe-dma-window output named "IO Page
> Sizes"
> >>>> will let the OS know all possible pagesizes that can be used for
> creating a
> >>>> new DDW.
> >>>>
> >>>> Currently Linux will only try using 3 of the 8 available options:
> >>>> 4K, 64K and 16M. According to LoPAR, Hypervisor may also offer 32M,
> 64M,
> >>>> 128M, 256M and 16G.
> >>>
> >>> Do we know of any hardware & hypervisor combination that will actually
> >>> give us bigger pages?
> >>
> >>
> >> On P8 16MB host pages and 16MB hardware iommu pages worked.
> >>
> >> On P9, VM's 16MB IOMMU pages worked on top of 2MB host pages + 2MB
> >> hardware IOMMU pages.
> >
> > The current code already tries 16MB though.
> >
> > I'm wondering if we're going to ask for larger sizes that have never
> > been tested and possibly expose bugs. But it sounds like this is mainly
> > targeted at future platforms.
>
>
> I tried for fun to pass through a PCI device to a guest with this patch as:
>
> pbuild/qemu-killslof-aiku1904le-ppc64/qemu-system-ppc64 \
> -nodefaults \
> -chardev stdio,id=STDIO0,signal=off,mux=on \
> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
> -mon id=MON0,chardev=STDIO0,mode=readline \
> -nographic \
> -vga none \
> -enable-kvm \
> -m 16G \
> -kernel ./vmldbg \
> -initrd /home/aik/t/le.cpio \
> -device vfio-pci,id=vfio0001_01_00_0,host=0001:01:00.0 \
> -mem-prealloc \
> -mem-path qemu_hp_1G_node0 \
> -global spapr-pci-host-bridge.pgsz=0xffffff000 \
> -machine cap-cfpc=broken,cap-ccf-assist=off \
> -smp 1,threads=1 \
> -L /home/aik/t/qemu-ppc64-bios/ \
> -trace events=qemu_trace_events \
> -d guest_errors,mmu \
> -chardev socket,id=SOCKET0,server=on,wait=off,path=qemu.mon.1_1_0_0 \
> -mon chardev=SOCKET0,mode=control
>
>
> The guest created a huge window:
>
> xhci_hcd 0000:00:00.0: ibm,create-pe-dma-window(2027) 0 8000000 20000000
> 22 22 returned 0 (liobn = 0x80000001 starting addr = 8000000 0)
>
> The first "22" is page_shift in hex (16GB), the second "22" is
> window_shift (so we have 1 TCE).
>
> On the host side the window#1 was created with 1GB pages:
> pci 0001:01     : [PE# fd] Setting up window#1
> 800000000000000..80007ffffffffff pg=40000000
>
>
> The XHCI seems working. Without the patch 16MB was the maximum.
>
>
> >
> >>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c
> b/arch/powerpc/platforms/pseries/iommu.c
> >>>> index 9fc5217f0c8e..6cda1c92597d 100644
> >>>> --- a/arch/powerpc/platforms/pseries/iommu.c
> >>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
> >>>> @@ -53,6 +53,20 @@ enum {
> >>>>            DDW_EXT_QUERY_OUT_SIZE = 2
> >>>>    };
> >>>
> >>> A comment saying where the values come from would be good.
> >>>
> >>>> +#define QUERY_DDW_PGSIZE_4K       0x01
> >>>> +#define QUERY_DDW_PGSIZE_64K      0x02
> >>>> +#define QUERY_DDW_PGSIZE_16M      0x04
> >>>> +#define QUERY_DDW_PGSIZE_32M      0x08
> >>>> +#define QUERY_DDW_PGSIZE_64M      0x10
> >>>> +#define QUERY_DDW_PGSIZE_128M     0x20
> >>>> +#define QUERY_DDW_PGSIZE_256M     0x40
> >>>> +#define QUERY_DDW_PGSIZE_16G      0x80
> >>>
> >>> I'm not sure the #defines really gain us much vs just putting the
> >>> literal values in the array below?
> >>
> >> Then someone says "uuuuu magic values" :) I do not mind either way.
> Thanks,
> >
> > Yeah that's true. But #defining them doesn't make them less magic, if
> > you only use them in one place :)
>
> Defining them with "QUERY_DDW" in the names kinda tells where they are
> from. Can also grep QEMU using these to see how the other side handles
> it. Dunno.
>
> btw the bot complained about __builtin_ctz(SZ_16G) which should be
> __builtin_ctzl(SZ_16G) so we have to ask Leonardo to repost anyway :)
>

Thanks for testing!

http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210408201915.174217-1-leobras.c@gmail.com/

I sent a v3 a few hours ago, fixing this by using __builtin_ctzll() instead
of __builtin_ctz() in all sizes, and it worked like a charm.

I also reverted to the previous approach of not having QUERY_DDW defines
for masks, as Michael suggested.

I can revert back to v2 approach if you guys decide it's better.

Best regards,
Leonardo Bras

--000000000000ea01ca05bf82d348
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Em sex., 9 de abr. de 2021 01:36, Alexey Kardashevskiy=
 &lt;<a href=3D"mailto:aik@ozlabs.ru">aik@ozlabs.ru</a>&gt; escreveu:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
<br>
On 08/04/2021 19:04, Michael Ellerman wrote:<br>
&gt; Alexey Kardashevskiy &lt;<a href=3D"mailto:aik@ozlabs.ru" target=3D"_b=
lank" rel=3D"noreferrer">aik@ozlabs.ru</a>&gt; writes:<br>
&gt;&gt; On 08/04/2021 15:37, Michael Ellerman wrote:<br>
&gt;&gt;&gt; Leonardo Bras &lt;<a href=3D"mailto:leobras.c@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">leobras.c@gmail.com</a>&gt; writes:<br>
&gt;&gt;&gt;&gt; According to LoPAR, ibm,query-pe-dma-window output named &=
quot;IO Page Sizes&quot;<br>
&gt;&gt;&gt;&gt; will let the OS know all possible pagesizes that can be us=
ed for creating a<br>
&gt;&gt;&gt;&gt; new DDW.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Currently Linux will only try using 3 of the 8 available o=
ptions:<br>
&gt;&gt;&gt;&gt; 4K, 64K and 16M. According to LoPAR, Hypervisor may also o=
ffer 32M, 64M,<br>
&gt;&gt;&gt;&gt; 128M, 256M and 16G.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Do we know of any hardware &amp; hypervisor combination that w=
ill actually<br>
&gt;&gt;&gt; give us bigger pages?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On P8 16MB host pages and 16MB hardware iommu pages worked.<br>
&gt;&gt;<br>
&gt;&gt; On P9, VM&#39;s 16MB IOMMU pages worked on top of 2MB host pages +=
 2MB<br>
&gt;&gt; hardware IOMMU pages.<br>
&gt; <br>
&gt; The current code already tries 16MB though.<br>
&gt; <br>
&gt; I&#39;m wondering if we&#39;re going to ask for larger sizes that have=
 never<br>
&gt; been tested and possibly expose bugs. But it sounds like this is mainl=
y<br>
&gt; targeted at future platforms.<br>
<br>
<br>
I tried for fun to pass through a PCI device to a guest with this patch as:=
<br>
<br>
pbuild/qemu-killslof-aiku1904le-ppc64/qemu-system-ppc64 \<br>
-nodefaults \<br>
-chardev stdio,id=3DSTDIO0,signal=3Doff,mux=3Don \<br>
-device spapr-vty,id=3Dsvty0,reg=3D0x71000110,chardev=3DSTDIO0 \<br>
-mon id=3DMON0,chardev=3DSTDIO0,mode=3Dreadline \<br>
-nographic \<br>
-vga none \<br>
-enable-kvm \<br>
-m 16G \<br>
-kernel ./vmldbg \<br>
-initrd /home/aik/t/le.cpio \<br>
-device vfio-pci,id=3Dvfio0001_01_00_0,host=3D0001:01:00.0 \<br>
-mem-prealloc \<br>
-mem-path qemu_hp_1G_node0 \<br>
-global spapr-pci-host-bridge.pgsz=3D0xffffff000 \<br>
-machine cap-cfpc=3Dbroken,cap-ccf-assist=3Doff \<br>
-smp 1,threads=3D1 \<br>
-L /home/aik/t/qemu-ppc64-bios/ \<br>
-trace events=3Dqemu_trace_events \<br>
-d guest_errors,mmu \<br>
-chardev socket,id=3DSOCKET0,server=3Don,wait=3Doff,path=3Dqemu.mon.1_1_0_0=
 \<br>
-mon chardev=3DSOCKET0,mode=3Dcontrol<br>
<br>
<br>
The guest created a huge window:<br>
<br>
xhci_hcd 0000:00:00.0: ibm,create-pe-dma-window(2027) 0 8000000 20000000 <b=
r>
22 22 returned 0 (liobn =3D 0x80000001 starting addr =3D 8000000 0)<br>
<br>
The first &quot;22&quot; is page_shift in hex (16GB), the second &quot;22&q=
uot; is <br>
window_shift (so we have 1 TCE).<br>
<br>
On the host side the window#1 was created with 1GB pages:<br>
pci 0001:01=C2=A0 =C2=A0 =C2=A0: [PE# fd] Setting up window#1 <br>
800000000000000..80007ffffffffff pg=3D40000000<br>
<br>
<br>
The XHCI seems working. Without the patch 16MB was the maximum.<br>
<br>
<br>
&gt; <br>
&gt;&gt;&gt;&gt; diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch=
/powerpc/platforms/pseries/iommu.c<br>
&gt;&gt;&gt;&gt; index 9fc5217f0c8e..6cda1c92597d 100644<br>
&gt;&gt;&gt;&gt; --- a/arch/powerpc/platforms/pseries/iommu.c<br>
&gt;&gt;&gt;&gt; +++ b/arch/powerpc/platforms/pseries/iommu.c<br>
&gt;&gt;&gt;&gt; @@ -53,6 +53,20 @@ enum {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DDW_EXT_QUERY_OUT=
_SIZE =3D 2<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 };<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; A comment saying where the values come from would be good.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +#define QUERY_DDW_PGSIZE_4K=C2=A0 =C2=A0 =C2=A0 =C2=A00x0=
1<br>
&gt;&gt;&gt;&gt; +#define QUERY_DDW_PGSIZE_64K=C2=A0 =C2=A0 =C2=A0 0x02<br>
&gt;&gt;&gt;&gt; +#define QUERY_DDW_PGSIZE_16M=C2=A0 =C2=A0 =C2=A0 0x04<br>
&gt;&gt;&gt;&gt; +#define QUERY_DDW_PGSIZE_32M=C2=A0 =C2=A0 =C2=A0 0x08<br>
&gt;&gt;&gt;&gt; +#define QUERY_DDW_PGSIZE_64M=C2=A0 =C2=A0 =C2=A0 0x10<br>
&gt;&gt;&gt;&gt; +#define QUERY_DDW_PGSIZE_128M=C2=A0 =C2=A0 =C2=A00x20<br>
&gt;&gt;&gt;&gt; +#define QUERY_DDW_PGSIZE_256M=C2=A0 =C2=A0 =C2=A00x40<br>
&gt;&gt;&gt;&gt; +#define QUERY_DDW_PGSIZE_16G=C2=A0 =C2=A0 =C2=A0 0x80<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;m not sure the #defines really gain us much vs just putt=
ing the<br>
&gt;&gt;&gt; literal values in the array below?<br>
&gt;&gt;<br>
&gt;&gt; Then someone says &quot;uuuuu magic values&quot; :) I do not mind =
either way. Thanks,<br>
&gt; <br>
&gt; Yeah that&#39;s true. But #defining them doesn&#39;t make them less ma=
gic, if<br>
&gt; you only use them in one place :)<br>
<br>
Defining them with &quot;QUERY_DDW&quot; in the names kinda tells where the=
y are <br>
from. Can also grep QEMU using these to see how the other side handles <br>
it. Dunno.<br>
<br>
btw the bot complained about __builtin_ctz(SZ_16G) which should be <br>
__builtin_ctzl(SZ_16G) so we have to ask Leonardo to repost anyway :)<br></=
blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks=
 for testing!</div><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D=
"http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210408201915.1742=
17-1-leobras.c@gmail.com/">http://patchwork.ozlabs.org/project/linuxppc-dev=
/patch/20210408201915.174217-1-leobras.c@gmail.com/</a><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I sent a v3 a few hours ago, fixing t=
his by using=C2=A0<span style=3D"font-family:sans-serif">__builtin_ctzll() =
instead of=C2=A0</span><span style=3D"font-family:sans-serif">__builtin_ctz=
() in all sizes, and it worked like a charm.</span></div><div dir=3D"auto">=
<span style=3D"font-family:sans-serif"><br></span></div><div dir=3D"auto"><=
span style=3D"font-family:sans-serif">I also reverted to the previous appro=
ach of not having QUERY_DDW defines for masks, as Michael suggested.=C2=A0<=
/span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif"><br></=
span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">I can r=
evert back to v2 approach if you guys decide it&#39;s better.</span></div><=
div dir=3D"auto"><span style=3D"font-family:sans-serif"><br></span></div><d=
iv dir=3D"auto"><span style=3D"font-family:sans-serif">Best regards,</span>=
</div><div dir=3D"auto"><span style=3D"font-family:sans-serif">Leonardo Bra=
s</span></div></div>

--000000000000ea01ca05bf82d348--
