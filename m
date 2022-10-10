Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB7B5F984A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 08:23:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm8413VMRz3dsS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 17:23:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Hzx6wEka;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Hzx6wEka;
	dkim-atps=neutral
X-Greylist: delayed 322 seconds by postgrey-1.36 at boromir; Mon, 10 Oct 2022 17:22:20 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm8303lXxz306m
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 17:22:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1665382936;
	bh=t5oCng6qrXN7iFHvVA23nQRcP3eRpq4/4Y+SJ+WKMQI=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Hzx6wEkanugexphWVi/+JzyAa/4/wEWPXmiOqdq/pP9AyyQvyuKnF6IWIrckRwR52
	 D/f8YZG5I4jIDWSLzbzCyCu23XK4mC5h4iwYzHL9bEUvskgKLV8dNJspl1yhyfLMDB
	 kjoYLKtdNBnmGC2rQa4Ty9IILkCd5VcxFNOzub4Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.63]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPokN-1oTo0B20UV-00Mvbw; Mon, 10
 Oct 2022 08:16:24 +0200
Message-ID: <9f0b3333-bb28-c739-9bff-6fc50343b4f9@gmx.de>
Date: Mon, 10 Oct 2022 08:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 4/4] arc: Use generic dump_stack_print_cmdline()
 implementation
Content-Language: en-US
To: Vineet Gupta <vineet.gupta@linux.dev>, linux-s390@vger.kernel.org,
 Josh Triplett <josh@joshtriplett.org>, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20220808130917.30760-1-deller@gmx.de>
 <20220808130917.30760-5-deller@gmx.de>
 <8da9812d-eb84-2a84-321e-ea2826ef8981@linux.dev>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <8da9812d-eb84-2a84-321e-ea2826ef8981@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NudOz7Pq8zqMzpDkWxd+lvw7MQLHFVHX4y2D3B0lFEDuIKKr66h
 qegUDgOH06dY83pJcJsE8la8/wqBLjQilAdyHfNW5OH54FBiT1VLNreHyu0NRHrlEcsSOLy
 +yFRkaihB4vP1N2x0uNckW/llOKv6XGjxN+5YnddWyS642ImXCjF9f8FJuuWfjgGBQEmN9e
 +sLRo1pOuHdypN3cwk4wQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2rXkN87mDKk=:1WIZ5jvKtu3spF0qmbIRiD
 lP6DPTjSwjZr/G44JssG2mnB2Atxpx0shSFQu1tIKh9DcsbBJbUNsVtPkcrJD7GUTuIFVY5Gm
 6uHO4gZPe6pIzBgmrKcy9/JbhSOeXUPhkeLSZi5LfOJtM3L88D3IOkf05NrtO6Ymdw8II8xV7
 JbmZNy2zWfTAl5RyYAXtFgyVwINUFa2yqclxjxm/IxTk+Ud6f92pSAu6Rh5wb9x/8lToePZzx
 IKR7zyss9J/9bdxlMyflyWzPqdXCe7hS0EwNPTmqXYDQ8Q8sLcGNvO36/E2eTc6td6X+QilX3
 4k18r24Cx6PjCyQDw6O9IPGnZatXAgNEc7lEoULsmToYHPpBDS63rebYnfhyo8NOVyDnhMixq
 3cbDoD9A5MAO5W6ll6fHhbrlSypJLTsGW/L+cgyV1yzsJ0lbvf3ePyMP6rxCwf0vgYqgeEo8W
 1cnR5MEJdE2AAc42Y/9BJDgBDPzyOwGUNleLSRAIEwXiqn8WYTJcyDVON+pF82YS4wtRSEpqq
 tOUI8qbGcDDd8moyqj4HsvZnowre3HDuAzpAwfCQ4scZRyTcMeNKI/v4XOoTprb2OaOBV3Ud+
 RZjxzSPl8pn98jTlyDy0jTN6XM/CW28dhh1LUVHTPYEH4dY2vBPbEMe6lrzYKs4i62xy1wNNq
 +npnVcqmjB8wxgeQ8tQ9lMVkCm/QSzCFkXaZm9wuB0DO4dZbURf3EL1c8u5q1aCmbOvEf4oJr
 U2kbuW+gGndjEGCiHIGMoiFE4A9tlpY61m/WLkIbl5NL6xK6dbxD5L8yzd/I/ufuMUO1r2BTU
 NZRqSnUzyKUoH/ypkkJGqA9ccmtFIAPcLTRh+NM023j6m4EuIDdxsu8R9YzmCm+lUkfyZHUK9
 Cu7wGv6c2RZUFB4xeWZp7GxvBka+rybablfq2QdCj+R5RxK0PLdJRumdNH9ZLTCe269s+l7RO
 Ay5n5+Bsd+uY3lMc6AQ+owi0xEfH0EkxCODblQJ5u2Da/8IKry8HevBwltl+FmykNDKLegrIE
 DM2wV5k/mXyZoX4eUFa5x9VlXaQYUIUOVad973V7Q4TM1BevCRMkjHHqg9wm2OXqd8ZrfaeZB
 Mrf6ybdNek1eYyaZ7kSxvoxMmoiZIfiBRqwNS47398wRJ0ySlfq6QkSJiFRn7kwvKjGSV6ruq
 7/duKPDaq1YYF4Si49BzuQd7JPbfp/MvAew9jOBZLmPk9XTzblg/z+UEGbe88dP0NMRpcJ8pp
 smCBt13mxG4GI3NpRlev0J+VjTilH/fFP67jXXmRsVbnuck3h9z2dlMUbIqgNEcyz5s+6sjcv
 22Lr5AM9NsPECnlDkgEa8ISINOk/Au6UKsBpFn8id84SrKm0xkPk7ErrW1zDlgYLs1DIkc+/2
 eWwhXrm1VVzBFz3+WLK4iPLAHmdY3558o08vGbakkdT2g6LWERdwJftzn6s/a8JmkuibAKujK
 7UzN2fBgLOMhknqUWgQI/jv+fHYVfJgIwGv5c0EtFrCaXOiJL//sJ19ePqcZahl0SUy9Puen+
 GL1TE0OD5XmD2xYRmcOKRnajvl4AS3e4bNskVVK5dHqY4
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
Cc: Alexey Brodkin <abrodkin@synopsys.com>, Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/10/22 07:18, Vineet Gupta wrote:
> On 8/8/22 06:09, Helge Deller wrote:
>> The process program name and command line is now shown in generic code
>> in dump_stack_print_info(), so drop the arc-specific implementation.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>
> But that info printing was added back in 2018 by e36df28f532f882.
> I don't think arc is using show_regs_print_info -> dump_stack_print_info=
 yet.
> Or is there a different code path now which calls here ?

Right.
See patches #1 and #2 of this series which added this
info to dump_stack_print_info().


>> ---
>> =C2=A0 arch/arc/kernel/troubleshoot.c | 24 ------------------------
>> =C2=A0 1 file changed, 24 deletions(-)
>>
>> diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troublesh=
oot.c
>> index 7654c2e42dc0..9807e590ee55 100644
>> --- a/arch/arc/kernel/troubleshoot.c
>> +++ b/arch/arc/kernel/troubleshoot.c
>> @@ -51,29 +51,6 @@ static void print_regs_callee(struct callee_regs *re=
gs)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regs->r24, regs-=
>r25);
>> =C2=A0 }
>>
>> -static void print_task_path_n_nm(struct task_struct *tsk)
>> -{
>> -=C2=A0=C2=A0=C2=A0 char *path_nm =3D NULL;
>> -=C2=A0=C2=A0=C2=A0 struct mm_struct *mm;
>> -=C2=A0=C2=A0=C2=A0 struct file *exe_file;
>> -=C2=A0=C2=A0=C2=A0 char buf[ARC_PATH_MAX];
>> -
>> -=C2=A0=C2=A0=C2=A0 mm =3D get_task_mm(tsk);
>> -=C2=A0=C2=A0=C2=A0 if (!mm)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;
>> -
>> -=C2=A0=C2=A0=C2=A0 exe_file =3D get_mm_exe_file(mm);
>> -=C2=A0=C2=A0=C2=A0 mmput(mm);
>> -
>> -=C2=A0=C2=A0=C2=A0 if (exe_file) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 path_nm =3D file_path(exe_f=
ile, buf, ARC_PATH_MAX-1);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fput(exe_file);
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> -done:
>> -=C2=A0=C2=A0=C2=A0 pr_info("Path: %s\n", !IS_ERR(path_nm) ? path_nm : =
"?");
>> -}
>> -
>> =C2=A0 static void show_faulting_vma(unsigned long address)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vm_area_struct *vma;
>> @@ -176,7 +153,6 @@ void show_regs(struct pt_regs *regs)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 preempt_enable();
>
> Maybe we remove preempt* as well now (perhaps as a follow up patch)
> since that was added by f731a8e89f8c78 "ARC: show_regs: lockdep:
> re-enable preemption" where show_regs -> print_task_path_n_nm ->
> mmput was triggering lockdep splat which is supposedly removed.

The patch series was dropped from Andrew's queue, because the kernel
test robot showed some issues:
https://lore.kernel.org/lkml/Yu59QdVpPgnXUnQC@xsang-OptiPlex-9020/
Maybe adding preempt_enable() in my patches would fix that -
sadly I haven't had time to follow up on this yet ...

Helge

>
>>
>> -=C2=A0=C2=A0=C2=A0 print_task_path_n_nm(tsk);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_regs_print_info(KERN_INFO);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_ecr_verbose(regs);

