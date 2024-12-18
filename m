Return-Path: <linuxppc-dev+bounces-4332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 341BC9F68C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 15:42:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCxGQ0b7nz30Vv;
	Thu, 19 Dec 2024 01:42:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.54 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734532926;
	cv=pass; b=ZsZ6Ctcs/CNZDs8KIfF00qklo0HdFdL4Xc11q0teGiljDKt8x+yaCKw5yg+krjdtwrPCVfHHJ9ihFQVYoUkk5JvxLuU3+dDhc8cgSmgQmAZZgPCZ2Oj63M84rR5P5u+7nuqsTRFC+I9QIQ0NB/v4ss86eY3JURHvDUc3p3Flek2XxFbFO3jmHj6BalzzuZ85Mnu8XrgNCcRVzcON/y3ltbtIqurUZc95dT0dqK585ornYz6OVITtJRVXJRzNQQ2KQ3/geE6u0feIoXGBltBSU+xbrnhOW+bWlNAkHjk0n+kIMj/o1cGevjhYizm+t75bFDj2cqxcS5Endypj/VXf+g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734532926; c=relaxed/relaxed;
	bh=VoaJ674Dz9Ji3MhByg7qXA+c9MeGpzokPxZRl1XHuG0=;
	h=Subject:From:To:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=nNq0ggs43jt9AKhXd93iflWAImcQM+92ZAAGd9TNXTC8Plfos/WHNeafGESK25uyL3aeqRTxBQrS7A9DM6jqPG544Yg0fsGImRFvTsrM4h/HesAh4psaP7aGruUDbIyUW0v2cUSh3YB52E3SB4wdieGxG1LtbrjYtipMdHTxxUUhLzaogJSu4o6lCCPGUXlE220LUsqyFk2jN0ytj6SvBLuTKFBoQ1gya6ZOSgytUZMGpumRX8WpHlc2k1WCIPDXC06gs/umSCCJHmbrneUN3MiN+K9sE9MovipTM2bjZJWu5aWFy0fIpkTVatBAi/vdmzpHNANVubhs99qsNVfRog==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=HbupGoHD; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=CwcKHli4; dkim-atps=neutral; spf=pass (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=HbupGoHD;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=CwcKHli4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCxGL2Llfz30Vq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 01:42:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1734532915; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YJXfGUVyv/9bMLAUoH8VzSFFqnxuyprVfL3cYz1eFGvf8GZm05egNYhujii198hoYw
    dVzvTNqmpHzTvZHJkFe5f5vKHhziLvns/zpWKrOKVgxoL1BVKMQP812+lJP851Vn7X//
    eNRxXBX6huuwJ78bBYgbecC07hNNrzwYBDPtOl6ZwyInaQjvKog4wZA73kLDPojidi4/
    dcP//ucBnV3h/TLRE0DYwDWgz6VXMT3jn+ecrOiLAxNxxLPfYDlnqMum0mlU5gLs01a/
    sM2y4romnPEtBuNY5t21W1fPEzksjhqOQqZQp10xvXfcYEIJAxNoRiivbD5itekqsjfF
    oUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1734532915;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
    Subject:Sender;
    bh=VoaJ674Dz9Ji3MhByg7qXA+c9MeGpzokPxZRl1XHuG0=;
    b=e9ebCvIf8R53O+M+1SpUnExhL5W5wSuugAGm2ABMLcamwu+kdO12oMKRn9gudsWJ3q
    axfpR8VMLfhNWT5F6Eq+PStgMBegasyNF1bX0Br3JQTqQHZSk8KMPvh2LywxcCjVaRg7
    +Yb69mp2IFuZeeP9u3OXMLIDT/Ea4hah1lE+OAC5eyDF9A3QqdbSiMtGWvdz2VuGBdL6
    I8MLI+vaD8Mz2/bXgyu5lAdHg5p4hZL5U4yV7+wiz7mDeRBOUsVcjbIEmqNI+42c8GSk
    8bGmSF1/DYU1eyRjrkemvSHTIKKE6deNixeu8D+PRVEWEqPEQ6oHROfzarSNydjA9Vn2
    9bnQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1734532915;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
    Subject:Sender;
    bh=VoaJ674Dz9Ji3MhByg7qXA+c9MeGpzokPxZRl1XHuG0=;
    b=HbupGoHDEpuCfcfuNQZDnFrdiKmaRdvCvX5EEw2a6A1oBF17lZqepWkDd1Nk4F1YUn
    kCPd3//t42gpDacA99hDGUlC9YE7HGPLuuzMmDtVKtXwk/QXotQsDNquVVhwkktDNDHj
    hcWyZtXr5+uC4wTPQuSq8+SHdntiLZc8H97N5QFTIwhO9/zwymDpEZEFOIsWsbdedMg9
    65VZZ/WpwHDucyCQAXAnL36ZszVUHQ9duwDuhrBzzERYI6IVe2tl3TivKWBFgr0r8+Bj
    CZm8WozurHfwWYT8vyDAqWjUazDI4sMkVAOEcN4Su2EHwfxqxkmc0IDDqhIdREsqv3er
    GdGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1734532915;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:To:From:Subject:Cc:Date:From:
    Subject:Sender;
    bh=VoaJ674Dz9Ji3MhByg7qXA+c9MeGpzokPxZRl1XHuG0=;
    b=CwcKHli4iLWJwc5em3rSE7O2NWgEba3MOtSPa8YhH/rMPjexzEXf5qpZK8i80iOlcN
    Hb9ZQj9JO8RdF6VX9wBA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EisT29BnYJMBKrhBYBGwL4fUrhbbg=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.15 AUTH)
    with ESMTPSA id efffa60BIEfs7hy
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 18 Dec 2024 15:41:54 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Christian Zigotzky <info@xenosoft.de>, madskateman@gmail.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
Message-ID: <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
Date: Wed, 18 Dec 2024 15:41:54 +0100
X-Mailer: BrassMonkey/33.4.0
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
In-Reply-To: <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 18/12/24 12:10, Christian Zigotzky wrote:
> Hello,
>
> The KVM HV host module doesn't work anymore since the PowerPC updates 
> 6.13-1 [1] and PowerPC MM updates [2].
>
> We have tested it with our FSL P5020/P5040 boards [3].
>
> The guest kernel doesn't boot. There is no output via the serial 
> connection and no output via the graphics card. (QEMU)
>
> It boots without the PowerPC updates 6.13-1 [1] and PowerPC MM updates 
> [2].
>
> Is the problem already known? Is there already a solution? I have seen 
> many Book3S KVM HV updates. Have you perhaps forgotten Book3E?
>
> Thanks,
> Christian
>
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=42d9e8b7ccddee75989283cf7477305cfe3776ff
> [2] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c00ff742bf5caf85f60e1c73999f99376fb865d
> [3] http://wiki.amiga.org/index.php?title=X5000
>

I tried to bisect but without success. Link: 
https://github.com/chzigotzky/kernels/issues/4#issuecomment-2551460323

-- Christian

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


