Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B9C6F5B76
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 May 2023 17:47:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBLtf3J9Hz3cLT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 01:47:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=H+c0Ul+k;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=O31U8tpt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.80; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=H+c0Ul+k;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=O31U8tpt;
	dkim-atps=neutral
X-Greylist: delayed 134470 seconds by postgrey-1.36 at boromir; Thu, 04 May 2023 01:46:50 AEST
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBLsk428fz3bxC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 May 2023 01:46:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1683128794; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GyrdhAMWjE1IcR5NqJMTcS/B5pG5pjksVjUvkikJbp97sm7APqGCTqp/QqVDh1fN+r
    THi8M614r5n80NxkHSdJNzeUmlJzz8yGG9JTpaQIuUOaJW5A00HB+fxK/t5iwX8bd4Oc
    l/I7GW8bFqOAN5R0DmXyqjEVpeExCyT4zRXXmjlWKPjglupLUdFjSYk0VonLsi/i1UfE
    0RGbX6k+hdlDejzWrxe3ffa6Wq95/8wFV99Yj3QAkEx0FLLaOtk0eVAeFKUrtAevmeis
    Mc5eZPDar8FlAROXzyR/AaaF6e7AoDhxM6n+VwZfiqeQ/1HNL0bS+H/E+CRtLGrt75XC
    0c7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1683128794;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=qozef4uYqXO6hUcKXSBgHsegukJRekwXB2Rpf0Pgn5A=;
    b=bOkHx8i+Z18SwdVCAAY4uimbm6r34XELyBT801MfNiDhyl+EzJvcsx3U7g667JVtbW
    Axq1B30JLBGMH0/TPJqgy8X3HxJml2Rbixhx1GL0LQc9yCsXjWmtJSYgd4tssXWB7Bao
    PzML71Bf6WXnwV+Q9fW9LZR08Cwhq8UBhXJBy7YjwRaTQdgWj7MJS1GJGLdpyFlkKTSM
    MrBmCvZGvjE/YHzSgaCTOUXZsjBRGo4Um/a5d4fruhes8N/uTRt+hYM9ykNmbibvoNah
    oXy3lx24nROkUudkkNjKf3ZYYdypQRzDCD4RqXcTP/XHjP6mRU05lOH3x+S9ksRbbbYb
    vdfw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1683128794;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=qozef4uYqXO6hUcKXSBgHsegukJRekwXB2Rpf0Pgn5A=;
    b=H+c0Ul+kWq0z4q8NbXGRFA3d58OMLV3dHaUhVLGML6uFIxPAw1drLw7e0xCPV8iTqi
    W3mUIItl2KFwpVEjvfdRcyJitC1vSxwB/f6/q5UyCYsm484oKBCl7IgtAh2G2DOyOvIi
    LHn+xVsuKVNo6nvku90uyXCx0Cs+YfE201skM2mDr5A6xOjt7Ay0Z1Y9tCNcekBqoQZl
    bnClPfRJDMFp2BANMKCU7GF/4HPdkDfYjriOheYZqWoqie8/XXjwSO2wi4anUWCyC77l
    VxjAuex3wGAU12S9Jt7NjkqhcRDtEYVE1UWuYltMfiDx7Wza5aF5oeQ0DyYKXYJF64y0
    2EXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1683128794;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=qozef4uYqXO6hUcKXSBgHsegukJRekwXB2Rpf0Pgn5A=;
    b=O31U8tptAFH83zi0hd+MSjNppKhdlJk6/VCiYeC8f/1HlgrjIkunZ0PaLVSnT+Uqdy
    1FfziE/MZLcrg8/MCSCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjcvYWIdUUVZh/rP0RqZJAC3MKeDA=="
Received: from [IPV6:2a02:8109:8980:4474:9daa:c69c:9c43:d41c]
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id w2b3aez43FkXOG8
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 3 May 2023 17:46:33 +0200 (CEST)
Message-ID: <3fa42c8c-09bd-d0f0-401b-315b484f4bb0@xenosoft.de>
Date: Wed, 3 May 2023 17:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
Content-Language: de-DE
To: Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
 <87ednz6q0i.fsf@mail.lhotse>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <87ednz6q0i.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02 May 2023 at 11:28 am, Michael Ellerman wrote:
> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
>> Hello,
>>
>> Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6.4-1 [2].
>>
>> The kernel hangs right after the booting Linux via __start() @
>> 0x0000000000000000 ...
>>
>> I was able to revert the PowerPC updates 6.4-1 [2] with the following
>> command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
>>
>> After a re-compiling, the kernel boots without any problems without the
>> PowerPC updates 6.4-1 [2].
>>
>> Could you please explain me, what you have done in the boot area?
> There's a few possibilities, but nothing obvious.
>
> To begin with can you please test the following commits?
>
> 77e69ee7ce07
> e4ab08be5b49
> eeac8ede1755
>
> cheers
git revert e4ab08be5b4902e5b350b0e1e1a3c25eb21d76d4

[master 0086e2cbbec0] Revert "powerpc/isa-bridge: Remove open coded 
"ranges" parsing"
  1 file changed, 129 insertions(+), 37 deletions(-)

After a recompiling it boots without any problems.

e4ab08be5b49 -- powerpc/isa-bridge: Remove open coded "ranges" parsing 
is the bad commit.

Thanks
