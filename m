Return-Path: <linuxppc-dev+bounces-16891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NQUMg0tlGmdAQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 09:55:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F1B14A1DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 09:55:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFYPz0mGtz2yS4;
	Tue, 17 Feb 2026 19:55:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.162 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771318534;
	cv=pass; b=SD2j95pKiMeXJbrascO9nHxdTHce634Z2ZhfkNeXJEnpODxozfyb4m4Znl4s2fGD/+qvTfXKH+FFwQs1DXk6QoOS/ZqaHg7eyXpeYTlr5M2XKRpg4lkO9UnBWkiTJbqH+M0OliU/smxykP8T2snfZjqQfh9CAgXIRb+fJfW6i1devPBVyhGvZ/WsWwJvAX5lhoNHySIAIig93bOTvsLIGqons63/ZjURR10C3e9q3uvOXjr/OixMBegeV1YaUsDJfJgmVb9Md9lq7KrVSc0pmhXrzz/8YBr/fYv5CIn3vURwqQw+lZdhHkAQY97K8akVHkPi6fTvIOzrjtG/0HEV5g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771318534; c=relaxed/relaxed;
	bh=48vBFzOGGOEeE99Nc41Bo5BNddAb3r8A2Ni0fWDc2Mw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XddvejCjRaJeqVzUAB19qGTJfOun6mIdZfwVdEr63foCpkatC5hwPGLEBEwFl51R30PiNiBTxzgwAVZrWVrJCggFOV1zpE4EfB9onFYAMjw8Vnt2LViSn2iuxEdQdAzqU/fumv60lruvbMhsYS9GC8k7eKmX0BeQICyKfi5h6IbTbU4X73lVJxNuZ50F9FJhnv0kHexMqVDrPh6HDaNJOlx72UzREXJ42Kkyl81XaUCc6kPL60Mgl6366uJFi2hbo5ecMixES8FP4DlVNwVYhReHO/bkZycLNZaPs0VmYmWuM0Apbqgj6PuypA9bkuPgGYaS3GoJtWWgeYBT46/83A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=n60x/vpn; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=9PVUnvk9; dkim-atps=neutral; spf=pass (client-ip=81.169.146.162; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p00-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=n60x/vpn;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=9PVUnvk9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.162; helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFYPt5Hq4z2xN5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 19:55:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1771318345; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=N4YYXogl63smYxUHVcVvvbnqCr1Z8HTyOyZ+z/7bec+6rw4AUqUIfvjRhHsYGRx3WT
    1hj9JAwJ2Z0FsxdyvigpfZkkkYyu+dHSdmivx6X9bUlMrnbcOqhQvLn5Kqkm4sdrcmVE
    37LQSPUxPByhMwtxx2Z9+ksqu5JQLtoqsgal5iTxfD9l+XRIcPGpOSLGDsmtNtHR/yb7
    5kaqv47L0Io5+rsHzL1ydIrH7iSGodocXffkQeB6ZdWzmJgJ5bxcPEux1OnWHbi9OXqo
    IuqIKWwywc768YXTngOok3q3c4Vz4iFJ4h9qzCsiRGjH3vK4789TPrPmg3yi/bayUy/K
    UMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771318345;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=48vBFzOGGOEeE99Nc41Bo5BNddAb3r8A2Ni0fWDc2Mw=;
    b=pckflT7AM89p6G2vYzJvRVPIdAwH5g3Rl8ZaVruRoZhPWDZRRSlAA/2iarR3SORkPh
    Fm/0zc2W8IWdxo/Q7HY3xDT4Euy86uoo/BwWUZM7kTxncaX17YcFizR0vMuB1vDpUOlz
    1sbdPF8jTeuo/PJ67EffWRrI1ErTuWyquVRc0H1AWr60UfwrirKri1Mxf7UUede4JvRA
    AkF9z1WkNdxWuMRfQCir+keo9CPEDJKq3l20kUJNYSEKaT9Hh8iD8HmqYuZzy8SI3OoV
    uOrtqptOteCSTDkC0vZ08jAQnmLzseKhpLPF5q50AeOmK6ESZK39V22pRtQa5IVbMLrd
    UXIw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771318345;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=48vBFzOGGOEeE99Nc41Bo5BNddAb3r8A2Ni0fWDc2Mw=;
    b=n60x/vpnu4FYaaNqLCJFbJVuVftOQLgRzpKHBAxYWcUhd56S3HDOjnk8pwY7RIvljd
    sC4/dw0ZI7cY+wbEGNO596XN4+F21PMfdwJVHBsT0RXrUL8e7DaWVHOBoPHg/XHPo7F+
    0uC6FUSmM14PtQjcqcJXov0W2cPOZWBtrZgwMnZf9Kc4/+h8jlnzPpbkibDO/NBaic8K
    NNR4VFDsKKYIS+DBWYesCFilApKk2ko933a1Y2jziKl2mLGSrm/PCfjpxKuZ2bEiT6nZ
    wtyTPKCHqFE8DFoqJZCH3eIPBEV+JEA1d8Dwvh5brUvSVNfbll6BxRWi0DEb6IhwEqbW
    RouQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771318345;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=48vBFzOGGOEeE99Nc41Bo5BNddAb3r8A2Ni0fWDc2Mw=;
    b=9PVUnvk9KjZ6PDDZdP77vGSoHY3FlQHV9LiiivP+KHRSY9fuW0k39F4rpx+Mk67vIH
    XfOoa0qTcqEa5Dpg0XAg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIC+l7h/g"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id e9337f21H8qOz5U
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 17 Feb 2026 09:52:24 +0100 (CET)
Subject: [Linux PPC] KVM PR and KVM HV do not work if the kernel was compiled
 with PREEMPT
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
Date: Tue, 17 Feb 2026 09:52:24 +0100
X-Mailer: BrassMonkey/33.9.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[xenosoft.de,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[xenosoft.de:s=strato-dkim-0002,xenosoft.de:s=strato-dkim-0003];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-16891-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[xenosoft.de:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 98F1B14A1DE
X-Rspamd-Action: no action

Hi,

Thank you for your patch. I tested the latest git kernel with your patch 
today. Unfortunately the system freezes while booting the VM with KVM HV.

Cheers,
Christian


On 17/02/26 06:02, Shrikanth Hegde wrote:
>
>
> On 2/14/26 7:32 PM, Christian Zigotzky wrote:
>> Hello,
>>
>> KVM PR and KVM HV do not work if the kernel was compiled with PREEMPT.
>>
>> The entire FSL Cyrus+ board freezes when using KVM HV with PREEMPT.
>>
>> The guest kernel doesn't boot if we use KVM PR with a PREEMPT kernel 
>> on the PA Semi Nemo board.
>>
>> We were previously able to disable PREEMPT in the kernel 
>> configuration, but the latest git kernels now enable it by default 
>> and it is no longer possible to disable it.
>>
>> I created a patch for disabling PREEMPT today. [1]
>>
>> Is it possible to let us decide whether to activate PREEMPT or not?
>>
>> Thanks in advance,
>>
>> Christian
>>
>> [1] https://raw.githubusercontent.com/chzigotzky/kernels/ 
>> a74fa6179eaeafcea7ad89f0e61c30ace038daf2/patches/X1000/ 
>> Kconfig.preempt.patch
>> [2] Bug report: https://github.com/chzigotzky/kernels/issues/19
>
>
> Hi.
>
> Do you have any trace why it is stuck? That would be useful.
>
>
>
> My initial take is cond_resched is a nop. So we might be stuck there.
> Eventually it should have come out though.
>
> Could you please give the below patch a try and let me know?
> Note: This likely still needs lazy bit handling. So keep in preempt=full.
> (Not tested)
>
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 7667563fb9ff..fe215d1177fe 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, 
> u64 time_limit,
>         }
>
>         if (need_resched())
> -               cond_resched();
> +               schedule();
>
>         kvmppc_update_vpas(vcpu);
>
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 9a89a6d98f97..54963c1d8b58 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -86,7 +86,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>         while (true) {
>                 if (need_resched()) {
>                         local_irq_enable();
> -                       cond_resched();
> +                       schedule();
>                         hard_irq_disable();
>                         continue;
>                 }


-- 
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)


