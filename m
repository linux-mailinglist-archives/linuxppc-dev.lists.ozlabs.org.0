Return-Path: <linuxppc-dev+bounces-4354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9069F9285
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 13:49:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YF6gP1Wcjz30W4;
	Fri, 20 Dec 2024 23:49:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.164 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734698961;
	cv=pass; b=VDFVNR6RGE2/bL0gzYWfbgNVKx7O5Fg4zZt4FB6xCjF0R5YMjq/VuycFclsLnSxzU/qr/W6EuMnfkjMkgfGC281LUhgSHGHJ7sQZS9/9hNlBWsn0j1dtf7A/6fLIjsBDE+2HvrJzM4HslDKUr9VdbVCkkaeWODGQbbDiYLngEJdE4KBPoxdPEXaEXr/DlnXIero3hl0rY+wMtx7GKd8uQl6wqxUTf2Xcauby2EtEisG8kfs0iu9G/BTKvSON798lI3Q+t/Q/rct5gsworhfuXqyxXE5QqvrE5Qu0urtzx1guojdLC9kKl+tyJ3qA9PE+yHkbs92QGjJ/3PEShqG7Cg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734698961; c=relaxed/relaxed;
	bh=46TA7R3t9o7xShUr7cO5pk8dVHgqX9hzVYQpYx6q4YE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=E9DjM4u1VmzAuJVnzbPXZznBYbD++PYtW4iHoZBHkeVJXnG5XYWi8DrmZl3rvkL3umRfUs2vxudY3ro/p5iKGZkT5xSNAHE3HJEFpL5fENJIzIWLvM6ep66q5Jx61NeFpHjFU78YE+hQoixVrMhJSlFgW7xxDrF43UnvwK+EBW+/PG1G78RqbDQkvvFnQ5Rz64AkR/kwWNMuHCz9Me8wFKbjpP1PboNuTkS9Cuf41/H1pL50MGuSdfwLAauGuH5L7p77PHFHU5228UEJ8uTufcOcvTTKwLMmFgJXPz7jP8suMHWWQINmT3fY3sU5FJuJFRAWMFi1YS7xqATg2pozGQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lFEy8isF; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=n8Uy0Xgq; dkim-atps=neutral; spf=pass (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lFEy8isF;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=n8Uy0Xgq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.164; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 2404 seconds by postgrey-1.37 at boromir; Fri, 20 Dec 2024 23:49:17 AEDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YF6gK6fzvz2yNn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2024 23:49:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1734698927; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tPVdNDWhwsuw+soDWpQzZrOFuOhAno7VeynZB4huqFKntGNHkNjlFJPKMIUUs1DIXT
    CqCWFmFYI3vuxcfv2pjJ+KdPwnAr2z3ZJUpxtYhZ+OrP6iMpnwxo2Ol72y7t0RHVx2JG
    oMSisyOVQWqr8SYHYEo36SltONsdaS2oW7ICNosrrcHOhh7rpfUiPhFhtATf8KBra6lm
    WctQl+IbhhJSUg3iBpfBpa+rl0EiwkWJK5hbQhNy3e/r0MGhLPJL31UpNF8QS0UC6Q6l
    Xmz8vpwJk54cAm0a2zK6IU/LNrDSdNncyDzEvGDzupmdE53qHU2JWzv6EdF71SKra+2e
    t/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1734698927;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=46TA7R3t9o7xShUr7cO5pk8dVHgqX9hzVYQpYx6q4YE=;
    b=ZFAcb36eaQsEhreXj8BlF2LYQq3hh2DdxABclVTBvUX2gX+u2gtze2g9LN9hahLRaH
    uaRRXOOKmiklqsR+r+UMSswpgQ7GrlR3iCo0uESOIdFLBF3Vvro9ZXopyhTQRKGtqWgy
    JSAFLX6Gp/kULFpsEcZCZF+PX5PwSqdXulYkuKgVgXd2A7MXecGgMBkcH7LOuB++oGfF
    VxHvM60jn2y7sxRmMkiGTgzAu0yImgMR3NYRPnlPRU7+Xe6KLWPzUmKp7ii8utHH3vMs
    b0ApFh4Ae2TwdMz73ifTNK4+eSfyH8jlo6NGMvFWRm9eTSjSo8R22O+GxdmuGCk++FcW
    W7eg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1734698927;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=46TA7R3t9o7xShUr7cO5pk8dVHgqX9hzVYQpYx6q4YE=;
    b=lFEy8isFsAzrjKxnqXZJK6VILSI0GQQpzGzkHCRPygf9m5CD0TnpOWXuSMO4FcVIAB
    4cPltWr7QJ77goeROijOjVaf8AyDGdq5fMPaHn74C/gnPqtb08SSPwNfvxA7hogBVSZe
    gIM+S8JTxiSdN74CsdenCR4RrOfD5uyhOybS62O46li2QJ3+HgR1QTxCGOz8kq/S2XV2
    VOcP1rnsjyAjrzSjnaZGc44UGvx9TCxSbXMZkRzZR0jxHAkh6QbKPpOm+PIL18fDzUsB
    Q0RLuIDV1YfX0aV5q28M/2UVwyV8M8E7gKky3vgD98RFhR+V11b4A8fZyHTMtyhSjBKc
    Cv/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1734698927;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=46TA7R3t9o7xShUr7cO5pk8dVHgqX9hzVYQpYx6q4YE=;
    b=n8Uy0XgqpgjaG0LyBnCDL3z9ta/qQ32eYVWnj8ZwrUSW4BJtLQvpivP3GhyO0n5Lse
    Qo+wPR8Kye8XtX0ylkBg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr44+gKidpmhkOpz09kpM="
Received: from [192.168.178.136]
    by smtp.strato.de (RZmta 51.2.16 DYNA|AUTH)
    with ESMTPSA id ebe9c90BKCml6gK
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 20 Dec 2024 13:48:47 +0100 (CET)
Message-ID: <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
Date: Fri, 20 Dec 2024 13:48:46 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Christian Zigotzky <info@xenosoft.de>, madskateman@gmail.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 Paolo Bonzini <pbonzini@redhat.com>
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 20/12/24 13:08 Christian Zigotzky wrote:
> On 18/12/24 15:41, Christian Zigotzky wrote:
>> On 18/12/24 12:10, Christian Zigotzky wrote:
>>> Hello,
>>>
>>> The KVM HV host module doesn't work anymore since the PowerPC 
>>> updates 6.13-1 [1] and PowerPC MM updates [2].
>>>
>>> We have tested it with our FSL P5020/P5040 boards [3].
>>>
>>> The guest kernel doesn't boot. There is no output via the serial 
>>> connection and no output via the graphics card. (QEMU)
>>>
>>> It boots without the PowerPC updates 6.13-1 [1] and PowerPC MM 
>>> updates [2].
>>>
>>> Is the problem already known? Is there already a solution? I have 
>>> seen many Book3S KVM HV updates. Have you perhaps forgotten Book3E?
>>>
>>> Thanks,
>>> Christian
>>>
>>> [1] 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=42d9e8b7ccddee75989283cf7477305cfe3776ff
>>> [2] 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c00ff742bf5caf85f60e1c73999f99376fb865d
>>> [3] http://wiki.amiga.org/index.php?title=X5000
>>>
>>
>> I tried to bisect but without success. Link: 
>> https://github.com/chzigotzky/kernels/issues/4#issuecomment-2551460323
>>
>> -- Christian
>>
> It seems, that the PowerPC updates 6.13-1 aren't responsible for this 
> issue. I had to test the PowerPC updates 6.13-1 during the bisect. [1]
>
> Bisecting: 428 revisions left to test after this (roughly 9 steps)
> [42d9e8b7ccddee75989283cf7477305cfe3776ff] Merge tag 'powerpc-6.13-1' 
> of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
>
> Result:  git bisect good
>
> There aren't any changes in the PowerPC MM updates [2].
>
> Do you have another idea? I like KVM HV on my FSL P5040 system and use 
> it very often for testing. However, KVM HV is hardly used by our 
> users, so we could remove it from our kernels if it were not fixed. It 
> would save space to remove it.
>
> -- Christian
>
> [1] https://github.com/chzigotzky/kernels/issues/4
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c00ff742bf5caf85f60e1c73999f99376fb865d
Maybe the kvm updates [1] from Paolo Bonzini are responsible for this issue.

+ Paolo Bonzini

I have found some changes in the e500_mmu_host.c file 
(a/arch/powerpc/kvm/e500_mmu_host.c) in the kvm updates [1].

-- Christian

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f16d5e6f220661f73b36a4be1b21575651d8833

