Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 728311B505F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 00:32:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496wCw3H8nzDqJs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 08:32:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=66.163.186.205;
 helo=sonic310-24.consmr.mail.ne1.yahoo.com;
 envelope-from=cairnteaser@yahoo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=kiUaUfJm; dkim-atps=neutral
Received: from sonic310-24.consmr.mail.ne1.yahoo.com
 (sonic310-24.consmr.mail.ne1.yahoo.com [66.163.186.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496vNj1vqDzDqjW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 07:54:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1587592475; bh=3YDBSlB6FP3Abqoz+oWHBYKbcjBJJjqx2MVLBaUF0sQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=kiUaUfJmQvyenBSYsVFR0HvJmt4dWV3A0DEnkPacjUg6A1Z8ZHHSHEbw9zWuq6F+4shdinCy6VBBh3H4c/BZ+f9wopJt0dldPVXY4b6ar8ti3jClHo8GT/wcLvYqLn2WSR0jJ+oKCNYccIRN2Ht0QaYrLtL4eLKyGp7BvpR5Ob4i13qRE4bfoPcK3AdmyYoH60lFL5N8iL2y3hLh6WerpV0IfOtqj9kz1Z2aCSlbiVse9Aj81gUpSJ4t9TE1YUa2OyX95Raq4nBWuL2FCZk+e890gUx5A6SvIHuO1uv22b7svNmwp3Smy7ll3R47XgftK08UusKS47XttQk6e9b8rQ==
X-YMail-OSG: AoOihwoVM1mdVsfq.eDB58Tgh60FA4PRgP8886FDWyYoI6Z1Rg7.BLYM_m8Qq.z
 SUyvRbcD7DXvIlGygaQw2JDcjAjPZY5aDD0WzFbFckGubK4vn8YkTBZL.JeS7zA26wfLm450om9X
 buLnFuqCL8qMBDGJDmIYqLNOtRz4pVnuxiWox2yA59Ej65msDbmYS8fG4Ielu9O59LcLsDx8xf0I
 d9tEjkLXGcKEvIzLXC9wrjT68nWQI8JdhAF1ar0SabIY2o8OXYYcszybtrOuOhzaB0XARcKZiIx4
 Wii6sI9uOGzO0D55Z2EQ5kmC_sQygKzMKdvZKH16Dz1BY0wkPmrLTX4Fn3Y.lUlOF1RWHasb.rXM
 doQF0R5M5KeZWqq94iNYg7cnCM9FgqEvzRYpul7jwnztareJKrSYC7PUcJhmWTY4.P.kzT_y9n1_
 r8qsQmhEfy5ybtKNGBeTjUVACMrOFZuS8DXr8lTneDTFs26DZBY9yU0Ewo.XFmeXKXVZ.m0vYnGX
 oRe6bzjVjKZWGX.qeinYRg8jfgiHJc.IdWp22oV1qLtX1RkfMn87nd3S.1wA7t4ULT8XkBdGT.Ux
 PcXToUHAWqt4GcxYP4mmmx4JluAd4J3Yn3EAUqbEjvWiHU_gZk3h5KJP4itQ6VzGsgNhds4IQrV2
 vMxRYx3sQUw3ptzchq7imdA_qUOOvhyPHAzm46kAIcWcv9wI0kBYkFI9GBlVURawsaxvg8SCVfsv
 C.mVQ3y.EUB9eFEfrcI_C8fif6gyCTsRl0QsCkSj4nNtX3cTyGoBSWgUIGj3u5RqeKX.PFpVWQ7X
 fGl6nNf4cHWyzOjaDZKP6czboW9b_JawMRL0x8UaEJWuCbJfEyJ2IxbFymhSImpwXPTGbL_1HcKy
 28ebBcXQipX_YT3wXo.4KBz_0wdQ766BGA8SCmCEbTR_mFPnSRyshn6BovWVnI415o3hy2JrKV3K
 pyaHvuONW0Xby2dA4Qlq9Aj39WL0cqXVnN7vuNalNigTgvkBzOqydAx_8JCPtdseT1uIu.u_VfcT
 1Dma3TvBB_YVMkWWPp5A4oEZLPB06CvqY_bIt66_G6f1dORT.GnVtKnJJAjA3uIdNuD8vR100aTT
 1CDjMMBD3HkNnZg5CSkWUCtP4m7eA6KOlBxe38MzWEwKwHr2.5smoRovyW7TcJc.YZLjutBUNlJp
 PxUQVTyCRcoQkhViCp9eJi9h3o4ApUaGfVlNPj_lNXXI_wjGxlALeBPorf6BkO0_ydvUtnVeW1Xf
 Km.rLB9OnN3rBXqikTKNON7rfuGzsFUqeywLR.E7oBybmrJ5fxfIwTTGES5NsJTuvw7xYaD2tY84
 sIZ7DwSc-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ne1.yahoo.com with HTTP; Wed, 22 Apr 2020 21:54:35 +0000
Date: Wed, 22 Apr 2020 21:54:35 +0000 (UTC)
From: Casey Cairn <cairnteaser@yahoo.com>
To: Mike Kravetz <mike.kravetz@oracle.com>, <derpyderpderp@googlegroups.com>, 
 "jsasphalt12@yahoo.com" <jsasphalt12@yahoo.com>
Message-ID: <199094272.3894.1587592475042@mail.yahoo.com>
In-Reply-To: <CADYN=9JbXi=rvBAvhwPh8aFu2ne4Hbu4T+PW3NP3Rv2is+x77w@mail.gmail.com>
References: <20200417185049.275845-1-mike.kravetz@oracle.com>
 <5E312000-05D8-4C5D-A7C0-DDDE1842CB0E@lca.pw>
 <4c36c6ce-3774-78fa-abc4-b7346bf24348@oracle.com>
 <CADYN=9+=tCDmddTYGY44onvrzbg7yrbacMDSxd4hhD+=b=Yeiw@mail.gmail.com>
 <86333853-0648-393f-db96-d581ee114d2b@oracle.com>
 <CADYN=9JbXi=rvBAvhwPh8aFu2ne4Hbu4T+PW3NP3Rv2is+x77w@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Clean up hugetlb boot command line processing
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_3893_617641698.1587592475034"
X-Mailer: WebService/1.1.15756 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102
 Safari/537.36 Edge/18.18363
X-Mailman-Approved-At: Thu, 23 Apr 2020 08:30:40 +1000
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
Cc: linux-doc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Peter Xu <peterx@redhat.com>,
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Mina Almasry <almasrymina@google.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Longpeng <longpeng2@huawei.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Qian Cai <cai@lca.pw>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Nitesh Narayan Lal <nitesh@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S.Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

------=_Part_3893_617641698.1587592475034
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

=20

    On Wednesday, April 22, 2020, 05:52:05 PM EDT, Anders Roxell <anders.ro=
xell@linaro.org> wrote: =20
=20
 On Mon, 20 Apr 2020 at 23:43, Mike Kravetz <mike.kravetz@oracle.com> wrote=
:
>
> On 4/20/20 1:29 PM, Anders Roxell wrote:
> > On Mon, 20 Apr 2020 at 20:23, Mike Kravetz <mike.kravetz@oracle.com> wr=
ote:
> >> On 4/20/20 8:34 AM, Qian Cai wrote:
> >>>
> >>> Reverted this series fixed many undefined behaviors on arm64 with the=
 config,
> >> While rearranging the code (patch 3 in series), I made the incorrect
> >> assumption that CONT_XXX_SIZE =3D=3D (1UL << CONT_XXX_SHIFT).=C2=A0 Ho=
wever,
> >> this is not the case.=C2=A0 Does the following patch fix these issues?
> >>
> >> From b75cb4a0852e208bee8c4eb347dc076fcaa88859 Mon Sep 17 00:00:00 2001
> >> From: Mike Kravetz <mike.kravetz@oracle.com>
> >> Date: Mon, 20 Apr 2020 10:41:18 -0700
> >> Subject: [PATCH] arm64/hugetlb: fix hugetlb initialization
> >>
> >> When calling hugetlb_add_hstate() to initialize a new hugetlb size,
> >> be sure to use correct huge pages size order.
> >>
> >> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> >> ---
> >>=C2=A0 arch/arm64/mm/hugetlbpage.c | 8 ++++----
> >>=C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> >> index 9ca840527296..a02411a1f19a 100644
> >> --- a/arch/arm64/mm/hugetlbpage.c
> >> +++ b/arch/arm64/mm/hugetlbpage.c
> >> @@ -453,11 +453,11 @@ void huge_ptep_clear_flush(struct vm_area_struct=
 *vma,
> >>=C2=A0 static int __init hugetlbpage_init(void)
> >>=C2=A0 {
> >>=C2=A0 #ifdef CONFIG_ARM64_4K_PAGES
> >> -=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
> >> +=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(ilog2(PUD_SIZE) - PAGE_SHIFT)=
;
> >>=C2=A0 #endif
> >> -=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(CONT_PMD_SHIFT - PAGE_SHIFT);
> >> -=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
> >> -=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(CONT_PTE_SHIFT - PAGE_SHIFT);
> >> +=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(ilog2(CONT_PMD_SIZE) - PAGE_S=
HIFT);
> >> +=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(ilog2(PMD_SIZE) - PAGE_SHIFT)=
;
> >> +=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(ilog2(CONT_PTE_SIZE) - PAGE_S=
HIFT);
> >>
> >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> >>=C2=A0 }
> >
> > I build this for an arm64 kernel and ran it in qemu and it worked.
>
> Thanks for testing Anders!
>
> Will, here is an updated version of the patch based on your suggestion.
> I added the () for emphasis but that may just be noise for some.=C2=A0 Al=
so,
> the naming differences and values for CONT_PTE may make some people
> look twice.=C2=A0 Not sure if being consistent here helps?
>
> I have only built this.=C2=A0 No testing.
>
> From daf833ab6b806ecc0816d84d45dcbacc052a7eec Mon Sep 17 00:00:00 2001
> From: Mike Kravetz <mike.kravetz@oracle.com>
> Date: Mon, 20 Apr 2020 13:56:15 -0700
> Subject: [PATCH] arm64/hugetlb: fix hugetlb initialization
>
> When calling hugetlb_add_hstate() to initialize a new hugetlb size,
> be sure to use correct huge pages size order.
>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

Tested-by: Anders Roxell <anders.roxell@linaro.org>

I tested this patch on qemu-aarch64.

Cheers,
Anders

> ---
>=C2=A0 arch/arm64/mm/hugetlbpage.c | 4 ++--
>=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 9ca840527296..bed6dc7c4276 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -455,9 +455,9 @@ static int __init hugetlbpage_init(void)
>=C2=A0 #ifdef CONFIG_ARM64_4K_PAGES
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>=C2=A0 #endif
> -=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(CONT_PMD_SHIFT - PAGE_SHIFT);
> +=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate((CONT_PMD_SHIFT + PMD_SHIFT) - P=
AGE_SHIFT);
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
> -=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate(CONT_PTE_SHIFT - PAGE_SHIFT);
> +=C2=A0 =C2=A0 =C2=A0 hugetlb_add_hstate((CONT_PTE_SHIFT + PAGE_SHIFT) - =
PAGE_SHIFT);
>
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>=C2=A0 }
> --
> 2.25.2
>

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp
derp=20
derp
derp
derp
derp
derp
derp
derp
---=20
You received this message because you are subscribed to the Google Groups "=
derpyderpderp" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to derpyderpderp+unsubscribe@googlegroups.com.
 =20
------=_Part_3893_617641698.1587592475034
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp43be65e7yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px=
;"><div></div>
        <div><br></div><div><br></div>
       =20
        </div><div class=3D"yahoo_quoted" id=3D"yahoo_quoted_7972670871">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Wednesday, April 22, 2020, 05:52:05 PM EDT, Anders R=
oxell &lt;anders.roxell@linaro.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">On Mon, 20 Apr 2020 at 23:43, Mike Kr=
avetz &lt;<a href=3D"mailto:mike.kravetz@oracle.com" ymailto=3D"mailto:mike=
.kravetz@oracle.com">mike.kravetz@oracle.com</a>&gt; wrote:<br></div><div d=
ir=3D"ltr">&gt;<br></div><div dir=3D"ltr">&gt; On 4/20/20 1:29 PM, Anders R=
oxell wrote:<br></div><div dir=3D"ltr">&gt; &gt; On Mon, 20 Apr 2020 at 20:=
23, Mike Kravetz &lt;<a href=3D"mailto:mike.kravetz@oracle.com" ymailto=3D"=
mailto:mike.kravetz@oracle.com">mike.kravetz@oracle.com</a>&gt; wrote:<br><=
/div><div dir=3D"ltr">&gt; &gt;&gt; On 4/20/20 8:34 AM, Qian Cai wrote:<br>=
</div><div dir=3D"ltr">&gt; &gt;&gt;&gt;<br></div><div dir=3D"ltr">&gt; &gt=
;&gt;&gt; Reverted this series fixed many undefined behaviors on arm64 with=
 the config,<br></div><div dir=3D"ltr">&gt; &gt;&gt; While rearranging the =
code (patch 3 in series), I made the incorrect<br></div><div dir=3D"ltr">&g=
t; &gt;&gt; assumption that CONT_XXX_SIZE =3D=3D (1UL &lt;&lt; CONT_XXX_SHI=
FT).&nbsp; However,<br></div><div dir=3D"ltr">&gt; &gt;&gt; this is not the=
 case.&nbsp; Does the following patch fix these issues?<br></div><div dir=
=3D"ltr">&gt; &gt;&gt;<br></div><div dir=3D"ltr">&gt; &gt;&gt; From b75cb4a=
0852e208bee8c4eb347dc076fcaa88859 Mon Sep 17 00:00:00 2001<br></div><div di=
r=3D"ltr">&gt; &gt;&gt; From: Mike Kravetz &lt;<a href=3D"mailto:mike.krave=
tz@oracle.com" ymailto=3D"mailto:mike.kravetz@oracle.com">mike.kravetz@orac=
le.com</a>&gt;<br></div><div dir=3D"ltr">&gt; &gt;&gt; Date: Mon, 20 Apr 20=
20 10:41:18 -0700<br></div><div dir=3D"ltr">&gt; &gt;&gt; Subject: [PATCH] =
arm64/hugetlb: fix hugetlb initialization<br></div><div dir=3D"ltr">&gt; &g=
t;&gt;<br></div><div dir=3D"ltr">&gt; &gt;&gt; When calling hugetlb_add_hst=
ate() to initialize a new hugetlb size,<br></div><div dir=3D"ltr">&gt; &gt;=
&gt; be sure to use correct huge pages size order.<br></div><div dir=3D"ltr=
">&gt; &gt;&gt;<br></div><div dir=3D"ltr">&gt; &gt;&gt; Signed-off-by: Mike=
 Kravetz &lt;<a href=3D"mailto:mike.kravetz@oracle.com" ymailto=3D"mailto:m=
ike.kravetz@oracle.com">mike.kravetz@oracle.com</a>&gt;<br></div><div dir=
=3D"ltr">&gt; &gt;&gt; ---<br></div><div dir=3D"ltr">&gt; &gt;&gt;&nbsp; ar=
ch/arm64/mm/hugetlbpage.c | 8 ++++----<br></div><div dir=3D"ltr">&gt; &gt;&=
gt;&nbsp; 1 file changed, 4 insertions(+), 4 deletions(-)<br></div><div dir=
=3D"ltr">&gt; &gt;&gt;<br></div><div dir=3D"ltr">&gt; &gt;&gt; diff --git a=
/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c<br></div><div di=
r=3D"ltr">&gt; &gt;&gt; index 9ca840527296..a02411a1f19a 100644<br></div><d=
iv dir=3D"ltr">&gt; &gt;&gt; --- a/arch/arm64/mm/hugetlbpage.c<br></div><di=
v dir=3D"ltr">&gt; &gt;&gt; +++ b/arch/arm64/mm/hugetlbpage.c<br></div><div=
 dir=3D"ltr">&gt; &gt;&gt; @@ -453,11 +453,11 @@ void huge_ptep_clear_flush=
(struct vm_area_struct *vma,<br></div><div dir=3D"ltr">&gt; &gt;&gt;&nbsp; =
static int __init hugetlbpage_init(void)<br></div><div dir=3D"ltr">&gt; &gt=
;&gt;&nbsp; {<br></div><div dir=3D"ltr">&gt; &gt;&gt;&nbsp; #ifdef CONFIG_A=
RM64_4K_PAGES<br></div><div dir=3D"ltr">&gt; &gt;&gt; -&nbsp; &nbsp; &nbsp;=
  hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);<br></div><div dir=3D"ltr">&gt=
; &gt;&gt; +&nbsp; &nbsp; &nbsp;  hugetlb_add_hstate(ilog2(PUD_SIZE) - PAGE=
_SHIFT);<br></div><div dir=3D"ltr">&gt; &gt;&gt;&nbsp; #endif<br></div><div=
 dir=3D"ltr">&gt; &gt;&gt; -&nbsp; &nbsp; &nbsp;  hugetlb_add_hstate(CONT_P=
MD_SHIFT - PAGE_SHIFT);<br></div><div dir=3D"ltr">&gt; &gt;&gt; -&nbsp; &nb=
sp; &nbsp;  hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);<br></div><div dir=
=3D"ltr">&gt; &gt;&gt; -&nbsp; &nbsp; &nbsp;  hugetlb_add_hstate(CONT_PTE_S=
HIFT - PAGE_SHIFT);<br></div><div dir=3D"ltr">&gt; &gt;&gt; +&nbsp; &nbsp; =
&nbsp;  hugetlb_add_hstate(ilog2(CONT_PMD_SIZE) - PAGE_SHIFT);<br></div><di=
v dir=3D"ltr">&gt; &gt;&gt; +&nbsp; &nbsp; &nbsp;  hugetlb_add_hstate(ilog2=
(PMD_SIZE) - PAGE_SHIFT);<br></div><div dir=3D"ltr">&gt; &gt;&gt; +&nbsp; &=
nbsp; &nbsp;  hugetlb_add_hstate(ilog2(CONT_PTE_SIZE) - PAGE_SHIFT);<br></d=
iv><div dir=3D"ltr">&gt; &gt;&gt;<br></div><div dir=3D"ltr">&gt; &gt;&gt;&n=
bsp; &nbsp; &nbsp; &nbsp;  return 0;<br></div><div dir=3D"ltr">&gt; &gt;&gt=
;&nbsp; }<br></div><div dir=3D"ltr">&gt; &gt;<br></div><div dir=3D"ltr">&gt=
; &gt; I build this for an arm64 kernel and ran it in qemu and it worked.<b=
r></div><div dir=3D"ltr">&gt;<br></div><div dir=3D"ltr">&gt; Thanks for tes=
ting Anders!<br></div><div dir=3D"ltr">&gt;<br></div><div dir=3D"ltr">&gt; =
Will, here is an updated version of the patch based on your suggestion.<br>=
</div><div dir=3D"ltr">&gt; I added the () for emphasis but that may just b=
e noise for some.&nbsp; Also,<br></div><div dir=3D"ltr">&gt; the naming dif=
ferences and values for CONT_PTE may make some people<br></div><div dir=3D"=
ltr">&gt; look twice.&nbsp; Not sure if being consistent here helps?<br></d=
iv><div dir=3D"ltr">&gt;<br></div><div dir=3D"ltr">&gt; I have only built t=
his.&nbsp; No testing.<br></div><div dir=3D"ltr">&gt;<br></div><div dir=3D"=
ltr">&gt; From daf833ab6b806ecc0816d84d45dcbacc052a7eec Mon Sep 17 00:00:00=
 2001<br></div><div dir=3D"ltr">&gt; From: Mike Kravetz &lt;<a href=3D"mail=
to:mike.kravetz@oracle.com" ymailto=3D"mailto:mike.kravetz@oracle.com">mike=
.kravetz@oracle.com</a>&gt;<br></div><div dir=3D"ltr">&gt; Date: Mon, 20 Ap=
r 2020 13:56:15 -0700<br></div><div dir=3D"ltr">&gt; Subject: [PATCH] arm64=
/hugetlb: fix hugetlb initialization<br></div><div dir=3D"ltr">&gt;<br></di=
v><div dir=3D"ltr">&gt; When calling hugetlb_add_hstate() to initialize a n=
ew hugetlb size,<br></div><div dir=3D"ltr">&gt; be sure to use correct huge=
 pages size order.<br></div><div dir=3D"ltr">&gt;<br></div><div dir=3D"ltr"=
>&gt; Signed-off-by: Mike Kravetz &lt;<a href=3D"mailto:mike.kravetz@oracle=
.com" ymailto=3D"mailto:mike.kravetz@oracle.com">mike.kravetz@oracle.com</a=
>&gt;<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Tested-by: Ander=
s Roxell &lt;<a href=3D"mailto:anders.roxell@linaro.org" ymailto=3D"mailto:=
anders.roxell@linaro.org">anders.roxell@linaro.org</a>&gt;<br></div><div di=
r=3D"ltr"><br></div><div dir=3D"ltr">I tested this patch on qemu-aarch64.<b=
r></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Cheers,<br></div><div d=
ir=3D"ltr">Anders<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">&gt;=
 ---<br></div><div dir=3D"ltr">&gt;&nbsp; arch/arm64/mm/hugetlbpage.c | 4 +=
+--<br></div><div dir=3D"ltr">&gt;&nbsp; 1 file changed, 2 insertions(+), 2=
 deletions(-)<br></div><div dir=3D"ltr">&gt;<br></div><div dir=3D"ltr">&gt;=
 diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c<br>=
</div><div dir=3D"ltr">&gt; index 9ca840527296..bed6dc7c4276 100644<br></di=
v><div dir=3D"ltr">&gt; --- a/arch/arm64/mm/hugetlbpage.c<br></div><div dir=
=3D"ltr">&gt; +++ b/arch/arm64/mm/hugetlbpage.c<br></div><div dir=3D"ltr">&=
gt; @@ -455,9 +455,9 @@ static int __init hugetlbpage_init(void)<br></div><=
div dir=3D"ltr">&gt;&nbsp; #ifdef CONFIG_ARM64_4K_PAGES<br></div><div dir=
=3D"ltr">&gt;&nbsp; &nbsp; &nbsp; &nbsp;  hugetlb_add_hstate(PUD_SHIFT - PA=
GE_SHIFT);<br></div><div dir=3D"ltr">&gt;&nbsp; #endif<br></div><div dir=3D=
"ltr">&gt; -&nbsp; &nbsp; &nbsp;  hugetlb_add_hstate(CONT_PMD_SHIFT - PAGE_=
SHIFT);<br></div><div dir=3D"ltr">&gt; +&nbsp; &nbsp; &nbsp;  hugetlb_add_h=
state((CONT_PMD_SHIFT + PMD_SHIFT) - PAGE_SHIFT);<br></div><div dir=3D"ltr"=
>&gt;&nbsp; &nbsp; &nbsp; &nbsp;  hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT=
);<br></div><div dir=3D"ltr">&gt; -&nbsp; &nbsp; &nbsp;  hugetlb_add_hstate=
(CONT_PTE_SHIFT - PAGE_SHIFT);<br></div><div dir=3D"ltr">&gt; +&nbsp; &nbsp=
; &nbsp;  hugetlb_add_hstate((CONT_PTE_SHIFT + PAGE_SHIFT) - PAGE_SHIFT);<b=
r></div><div dir=3D"ltr">&gt;<br></div><div dir=3D"ltr">&gt;&nbsp; &nbsp; &=
nbsp; &nbsp;  return 0;<br></div><div dir=3D"ltr">&gt;&nbsp; }<br></div><di=
v dir=3D"ltr">&gt; --<br></div><div dir=3D"ltr">&gt; 2.25.2<br></div><div d=
ir=3D"ltr">&gt;<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">______=
_________________________________________<br></div><div dir=3D"ltr">linux-a=
rm-kernel mailing list<br></div><div dir=3D"ltr"><a href=3D"mailto:linux-ar=
m-kernel@lists.infradead.org" ymailto=3D"mailto:linux-arm-kernel@lists.infr=
adead.org">linux-arm-kernel@lists.infradead.org</a><br></div><div dir=3D"lt=
r"><a href=3D"http://lists.infradead.org/mailman/listinfo/linux-arm-kernel"=
 target=3D"_blank">http://lists.infradead.org/mailman/listinfo/linux-arm-ke=
rnel</a><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">-- <br></div>=
<div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"l=
tr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br><=
/div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=
=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp=
<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><di=
v dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr"=
>derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></di=
v><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D=
"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br=
></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div d=
ir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">de=
rp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><=
div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"lt=
r">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></=
div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=
=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp=
<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><di=
v dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr"=
>derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></di=
v><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D=
"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br=
></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div d=
ir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">de=
rp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><=
div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"lt=
r">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></=
div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=
=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp=
<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><di=
v dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr"=
>derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></di=
v><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D=
"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br=
></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div d=
ir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">de=
rp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><=
div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"lt=
r">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></=
div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=
=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp=
<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><di=
v dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr"=
>derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></di=
v><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D=
"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br=
></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div d=
ir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">de=
rp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><=
div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"lt=
r">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></=
div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=
=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp=
<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><di=
v dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr"=
>derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></di=
v><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D=
"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br=
></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div d=
ir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">de=
rp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><=
div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"lt=
r">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></=
div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=
=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp=
<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><di=
v dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr"=
>derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></di=
v><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D=
"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br=
></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div d=
ir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">de=
rp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><=
div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"lt=
r">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></=
div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=
=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp=
<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><di=
v dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr"=
>derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></di=
v><div dir=3D"ltr">derp <br></div><div dir=3D"ltr">derp<br></div><div dir=
=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp=
<br></div><div dir=3D"ltr">derp<br></div><div dir=3D"ltr">derp<br></div><di=
v dir=3D"ltr">derp<br></div><div dir=3D"ltr">--- <br></div><div dir=3D"ltr"=
>You received this message because you are subscribed to the Google Groups =
"derpyderpderp" group.<br></div><div dir=3D"ltr">To unsubscribe from this g=
roup and stop receiving emails from it, send an email to derpyderpderp+<a h=
ref=3D"mailto:unsubscribe@googlegroups.com." ymailto=3D"mailto:unsubscribe@=
googlegroups.com.">unsubscribe@googlegroups.com.</a><br></div></div>
            </div>
        </div></body></html>
------=_Part_3893_617641698.1587592475034--
