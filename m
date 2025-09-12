Return-Path: <linuxppc-dev+bounces-12097-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629CB55750
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 22:01:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNlgZ20h4z2yRZ;
	Sat, 13 Sep 2025 06:01:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41c9:1:41f::167"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757707306;
	cv=none; b=NhzALjii/Ws9CY3a8BX8Z1514lKQGDF3z4YW5+65T6KKPOzqipoD2RK5tEbKqfAHvu4kyorWJi8YCMBDPapFX1yREUJkVnZNHwzNtF9qir0h9ux/ikjjNKdCNdjiTIpC1rxNnqINxeCfhPgNoKyEGZVCTpzlmTB6GGIi4uXYPvfpzTm3MkuADsF278E4mBqfAIhjWMLknO6ashzN3eBTG6xrSieLS7NrzJUQx7ktQSfDgwGPRwwQVxCN+6pAv0Ou14iuYAZwcWu69Q9ugHpgY6139aiN+xh0E05fSmm/Ipleo1+D7YRmS69hg5GHVQcaYYkc3SVfx80QZgNZKsG8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757707306; c=relaxed/relaxed;
	bh=r3gX+oQRYuXUbsWoc8MVK0ZZNALPzl+G1s8Z/bsQtQs=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type:Subject; b=Bs/5evsb3/HhGpY6hXJNk55H0kwl+0dUdqN0cj69uFwL1sUEBZs0pZMGSsdjWx/g0/zlXn+nSzxMdnRCt3dhBwCfbZcHhYGOxTwhULU+bwPNMD1wffW3JqTSd+Sa2fKUUoJKRWyiExxup1qhcGXv9UyNfbHiggxt6aEJJDXfUX+av1PX+aNYhuNsaQ3Wxmc7tykr7o7BM4ktYm3kgFfbeTSfqOYu02wbnvcPLBoBNpG65mW070dYwcaB9PnQifuFtSlIfMzwJkwdVbv8mK+OdaJ/+co4RIL5HAGoA5oi9jrelBeHzwi9RW0F9RGGgzK5OsyitAeuJrpWt/CCWAOiNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ilande.co.uk; dkim=pass (4096-bit key; unprotected) header.d=ilande.co.uk header.i=@ilande.co.uk header.a=rsa-sha256 header.s=20220518 header.b=u25Nx/xY; dkim-atps=neutral; spf=pass (client-ip=2001:41c9:1:41f::167; helo=mail.ilande.co.uk; envelope-from=mark.cave-ayland@ilande.co.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ilande.co.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ilande.co.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=ilande.co.uk header.i=@ilande.co.uk header.a=rsa-sha256 header.s=20220518 header.b=u25Nx/xY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ilande.co.uk (client-ip=2001:41c9:1:41f::167; helo=mail.ilande.co.uk; envelope-from=mark.cave-ayland@ilande.co.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 2425 seconds by postgrey-1.37 at boromir; Sat, 13 Sep 2025 06:01:43 AEST
Received: from mail.ilande.co.uk (mail.ilande.co.uk [IPv6:2001:41c9:1:41f::167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNlgW2TYpz2yMw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 06:01:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
	From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=r3gX+oQRYuXUbsWoc8MVK0ZZNALPzl+G1s8Z/bsQtQs=; b=u25Nx/xYRERXWhRO+q36smQB2M
	WkrZmdUiS8dAos+xuNffub2UOKaS0m/2A8xSVktZAWkD9EVjG7xckjjuQ39ZxrlW2/U+Q0m5LP6fe
	zSlImPEXJ/xhw8Vp0fawxzh9i2yngKhe7+NxpCQFJnru+5flZ2CPRYyAKTo3iAYp1gTiKF98Fca/S
	Qnr3TyD4OBggVrRoF6Y5v0qvtVsIpv7FRMHAUT+XlRNS8XLOA4Xgy+KPlTSJbvIVVSc2ZCp5en+Jr
	omWiWeZzFSVW4b3rWjX4PMzUz9MUWNBv2eh58nXT8nhb+1vtIpFpkT9xcnPQk1PeCetng/Ov+Kwsv
	jQDdm0jEYr88WV/cp5/Gmyy2Tk7znZzSnuuXcZTsZ5UqyW6wwkxXov1RZwK9bcnZdenUzPnZaxzYb
	BXLnPhaGHBOkGzsgxKP/dLVmAumHqUsUqdA2ScRdJgX8c+iNRyro8CGdq4mpmRjvm2sZxnUXvf54Y
	yyJoZadDGiYxCc2UQpu8S2Zx2fNMPGHPGS1lkpnBMGdMJ999nuWMYgwEgGeuxa4aGDvoaJUSxPjVj
	iOsgofcd4PkQdAoQG5l8i7wCbiNNz3k9WNKc0zB5ugOliYfa67ghoYdOnurCEYFGnhJrIlEaGapZF
	46KcONT4LR9NmhipW5LPxRa+fa/lcvtbbamMPour4=;
Received: from [2a02:8012:2f01::15d6]
	by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1ux9If-0003CF-5n
	for linuxppc-dev@lists.ozlabs.org; Fri, 12 Sep 2025 20:19:13 +0100
Message-ID: <5dddd2be-e53d-4067-82aa-02146c39223d@ilande.co.uk>
Date: Fri, 12 Sep 2025 20:21:10 +0100
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
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a02:8012:2f01::15d6
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
Subject: RFI: powerpc cpus supporting BLRM for MSR_LE
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)

Hi everyone,

I apologise if this is considered off-topic, however I'm aware that there are many 
people on this list with years of experience of PPC CPUs who may be able to help.

As part of my work on the QEMU Mac machines, I've been working on an implementation 
of BLRM "Byte Lane Reverse and Munge" [1] to support a developer working on running 
WinNT PPC under QEMU.

Whilst the patch is fairly complete, the problem I have is that there doesn't appear 
to be a concise list of CPUs that use BLRM (as opposed to proper LE memory accesses) 
when MSR_LE is enabled.

 From what I can gather all 64-bit CPUs use proper LE memory accesses, but it's not 
clear whether for 32-bit CPUs the use of BLRM can be derived from the PVR or other 
CPU registers.

Can anyone provide any insight as to which CPUs make use of BLRM for MSR_LE? For 
reference the 32-bit CPUs emulated by QEMU are as follows:

$ ./build/qemu-system-ppc -cpu ?
Available CPUs:
   603              PVR 00030100
   mpc8240          (alias for 603)
   vanilla          (alias for 603)
   604              PVR 00040103
   ppc32            (alias for 604)
   ppc              (alias for 604)
   603e_v1.1        PVR 00060101
   603e_v1.2        PVR 00060102
   603e_v1.3        PVR 00060103
   603e_v1.4        PVR 00060104
   603e_v2.2        PVR 00060202
   603e_v3          PVR 00060300
   603e_v4          PVR 00060400
   603e_v4.1        PVR 00060401
   603e             (alias for 603e_v4.1)
   stretch          (alias for 603e_v4.1)
   603p             PVR 00070000
   603e7v           PVR 00070100
   vaillant         (alias for 603e7v)
   603e7v1          PVR 00070101
   603e7            PVR 00070200
   603e7v2          PVR 00070201
   603e7t           PVR 00071201
   603r             (alias for 603e7t)
   goldeneye        (alias for 603e7t)
   740_v1.0         PVR 00080100
   740e             PVR 00080100
   750_v1.0         PVR 00080100
   750_v2.0         PVR 00080200
   740_v2.0         PVR 00080200
   750e             PVR 00080200
   750_v2.1         PVR 00080201
   740_v2.1         PVR 00080201
   750_v2.2         PVR 00080202
   740_v2.2         PVR 00080202
   750_v3.0         PVR 00080300
   740_v3.0         PVR 00080300
   750_v3.1         PVR 00080301
   750              (alias for 750_v3.1)
   typhoon          (alias for 750_v3.1)
   g3               (alias for 750_v3.1)
   740_v3.1         PVR 00080301
   740              (alias for 740_v3.1)
   arthur           (alias for 740_v3.1)
   750cx_v1.0       PVR 00082100
   750cx_v2.0       PVR 00082200
   750cx_v2.1       PVR 00082201
   750cx_v2.2       PVR 00082202
   750cx            (alias for 750cx_v2.2)
   750cxe_v2.1      PVR 00082211
   750cxe_v2.2      PVR 00082212
   750cxe_v2.3      PVR 00082213
   750cxe_v2.4      PVR 00082214
   750cxe_v3.0      PVR 00082310
   750cxe_v3.1      PVR 00082311
   745_v1.0         PVR 00083100
   755_v1.0         PVR 00083100
   755_v1.1         PVR 00083101
   745_v1.1         PVR 00083101
   755_v2.0         PVR 00083200
   745_v2.0         PVR 00083200
   755_v2.1         PVR 00083201
   745_v2.1         PVR 00083201
   755_v2.2         PVR 00083202
   745_v2.2         PVR 00083202
   755_v2.3         PVR 00083203
   745_v2.3         PVR 00083203
   755_v2.4         PVR 00083204
   745_v2.4         PVR 00083204
   755_v2.5         PVR 00083205
   745_v2.5         PVR 00083205
   755_v2.6         PVR 00083206
   745_v2.6         PVR 00083206
   755_v2.7         PVR 00083207
   745_v2.7         PVR 00083207
   745_v2.8         PVR 00083208
   745              (alias for 745_v2.8)
   755_v2.8         PVR 00083208
   755              (alias for 755_v2.8)
   goldfinger       (alias for 755_v2.8)
   750cxe_v2.4b     PVR 00083214
   750cxe_v3.1b     PVR 00083311
   750cxe           (alias for 750cxe_v3.1b)
   750cxr           PVR 00083410
   750cl_v1.0       PVR 00087200
   750cl_v2.0       PVR 00087210
   750cl            (alias for 750cl_v2.0)
   750l_v2.0        PVR 00088200
   750l_v2.1        PVR 00088201
   750l_v2.2        PVR 00088202
   750l_v3.0        PVR 00088300
   750l_v3.2        PVR 00088302
   750l             (alias for 750l_v3.2)
   lonestar         (alias for 750l_v3.2)
   604e_v1.0        PVR 00090100
   604e_v2.2        PVR 00090202
   604e_v2.4        PVR 00090204
   604e             (alias for 604e_v2.4)
   sirocco          (alias for 604e_v2.4)
   604r             PVR 000a0101
   mach5            (alias for 604r)
   7400_v1.0        PVR 000c0100
   7400_v1.1        PVR 000c0101
   7400_v2.0        PVR 000c0200
   7400_v2.1        PVR 000c0201
   7400_v2.2        PVR 000c0202
   7400_v2.6        PVR 000c0206
   7400_v2.7        PVR 000c0207
   7400_v2.8        PVR 000c0208
   7400_v2.9        PVR 000c0209
   7400             (alias for 7400_v2.9)
   g4               (alias for 7400_v2.9)
   g2               PVR 00810011
   mpc603           PVR 00810100
   g2hip3           PVR 00810101
   mpc8250_hip3     (alias for g2hip3)
   mpc8255_hip3     (alias for g2hip3)
   mpc8260_hip3     (alias for g2hip3)
   mpc8264_hip3     (alias for g2hip3)
   mpc8265_hip3     (alias for g2hip3)
   mpc8266_hip3     (alias for g2hip3)
   mpc8343          PVR 00830010
   mpc8347at        PVR 00830010
   mpc8347a         (alias for mpc8347at)
   e300c1           PVR 00830010
   mpc8349a         PVR 00830010
   mpc8343ea        PVR 00830010
   mpc8349e         PVR 00830010
   mpc8347ep        PVR 00830010
   mpc8347p         PVR 00830010
   mpc8347eap       PVR 00830010
   mpc8349          PVR 00830010
   mpc8347et        PVR 00830010
   mpc8347e         (alias for mpc8347et)
   mpc8347t         PVR 00830010
   mpc8347          (alias for mpc8347t)
   mpc8343a         PVR 00830010
   mpc8347eat       PVR 00830010
   mpc8347ea        (alias for mpc8347eat)
   mpc8347ap        PVR 00830010
   mpc8349ea        PVR 00830010
   mpc8343e         PVR 00830010
   e300c2           PVR 00840010
   e300c3           PVR 00850010
   e300             (alias for e300c3)
   mpc8379e         PVR 00860010
   e300c4           PVR 00860010
   mpc8377e         PVR 00860010
   mpc8377          PVR 00860010
   mpc8378          PVR 00860010
   mpc8379          PVR 00860010
   mpc8378e         PVR 00860010
   740p             PVR 10080000
   750p             PVR 10080000
   conan/doyle      (alias for 750p)
   460exb           PVR 130218a4
   460ex            (alias for 460exb)
   440epx           PVR 200008d0
   405d2            PVR 20010000
   x2vp4            PVR 20010820
   x2vp7            (alias for x2vp4)
   x2vp20           PVR 20010860
   x2vp50           (alias for x2vp20)
   405gpa           PVR 40110000
   405gpb           PVR 40110040
   405cra           PVR 40110041
   405gpc           PVR 40110082
   405gpd           PVR 401100c4
   405gp            (alias for 405gpd)
   405crb           PVR 401100c5
   405crc           PVR 40110145
   405cr            (alias for 405crc)
   405gpe           (alias for 405crc)
   stb03            PVR 40310000
   npe4gs3          PVR 40b10000
   npe405h          PVR 414100c0
   npe405h2         PVR 41410140
   405ez            PVR 41511460
   npe405l          PVR 416100c0
   stb04            PVR 41810000
   405d4            PVR 41810000
   405              (alias for 405d4)
   405lp            PVR 41f10000
   440epa           PVR 42221850
   440epb           PVR 422218d3
   440ep            (alias for 440epb)
   405gpr           PVR 50910951
   405ep            PVR 51210950
   stb25            PVR 51510950
   750fx_v1.0       PVR 70000100
   750fx_v2.0       PVR 70000200
   750fx_v2.1       PVR 70000201
   750fx_v2.2       PVR 70000202
   750fx_v2.3       PVR 70000203
   750fx            (alias for 750fx_v2.3)
   750fl            PVR 70000203
   750gx_v1.0       PVR 70020100
   750gx_v1.1       PVR 70020101
   750gl            PVR 70020102
   750gx_v1.2       PVR 70020102
   750gx            (alias for 750gx_v1.2)
   440-xilinx-w-dfpu PVR 7ff21910
   440-xilinx       PVR 7ff21910
   7450_v1.0        PVR 80000100
   7450_v1.1        PVR 80000101
   7450_v1.2        PVR 80000102
   7450_v2.0        PVR 80000200
   7441_v2.1        PVR 80000201
   7450_v2.1        PVR 80000201
   7450             (alias for 7450_v2.1)
   vger             (alias for 7450_v2.1)
   7451_v2.3        PVR 80000203
   7451             (alias for 7451_v2.3)
   7441_v2.3        PVR 80000203
   7441             (alias for 7441_v2.3)
   7451_v2.10       PVR 80000210
   7441_v2.10       PVR 80000210
   7455_v1.0        PVR 80010100
   7445_v1.0        PVR 80010100
   7455_v2.1        PVR 80010201
   7445_v2.1        PVR 80010201
   7455_v3.2        PVR 80010302
   7455             (alias for 7455_v3.2)
   apollo6          (alias for 7455_v3.2)
   7445_v3.2        PVR 80010302
   7445             (alias for 7445_v3.2)
   7455_v3.3        PVR 80010303
   7445_v3.3        PVR 80010303
   7455_v3.4        PVR 80010304
   7445_v3.4        PVR 80010304
   7447_v1.0        PVR 80020100
   7457_v1.0        PVR 80020100
   7447_v1.1        PVR 80020101
   7447             (alias for 7447_v1.1)
   7457_v1.1        PVR 80020101
   7457_v1.2        PVR 80020102
   7457             (alias for 7457_v1.2)
   apollo7          (alias for 7457_v1.2)
   7457a_v1.0       PVR 80030100
   apollo7pm        (alias for 7457a_v1.0)
   7447a_v1.0       PVR 80030100
   7457a_v1.1       PVR 80030101
   7447a_v1.1       PVR 80030101
   7457a_v1.2       PVR 80030102
   7457a            (alias for 7457a_v1.2)
   7447a_v1.2       PVR 80030102
   7447a            (alias for 7447a_v1.2)
   mpc8641d         PVR 80040010
   mpc8610          PVR 80040010
   e600             PVR 80040010
   mpc8641          PVR 80040010
   7448_v1.0        PVR 80040100
   7448_v1.1        PVR 80040101
   7448_v2.0        PVR 80040200
   7448_v2.1        PVR 80040201
   7448             (alias for 7448_v2.1)
   7410_v1.0        PVR 800c1100
   7410_v1.1        PVR 800c1101
   7410_v1.2        PVR 800c1102
   7410_v1.3        PVR 800c1103
   7410_v1.4        PVR 800c1104
   7410             (alias for 7410_v1.4)
   nitro            (alias for 7410_v1.4)
   mpc8540_v10      PVR 80200010
   e500_v10         PVR 80200010
   mpc8560_v10      PVR 80200010
   mpc8560_v20      PVR 80200020
   mpc8555_v10      PVR 80200020
   mpc8560_v21      PVR 80200020
   mpc8560          (alias for mpc8560_v21)
   mpc8555e_v10     PVR 80200020
   mpc8555_v11      PVR 80200020
   mpc8555          (alias for mpc8555_v11)
   mpc8541_v10      PVR 80200020
   mpc8541_v11      PVR 80200020
   mpc8541          (alias for mpc8541_v11)
   mpc8555e_v11     PVR 80200020
   mpc8555e         (alias for mpc8555e_v11)
   mpc8540_v20      PVR 80200020
   mpc8541e_v10     PVR 80200020
   mpc8541e_v11     PVR 80200020
   mpc8541e         (alias for mpc8541e_v11)
   mpc8540_v21      PVR 80200020
   mpc8540          (alias for mpc8540_v21)
   e500_v20         PVR 80200020
   e500v1           (alias for e500_v20)
   mpc8543e_v10     PVR 80210010
   mpc8543_v10      PVR 80210010
   mpc8548e_v10     PVR 80210010
   e500v2_v10       PVR 80210010
   mpc8548_v10      PVR 80210010
   mpc8543e_v11     PVR 80210011
   mpc8548e_v11     PVR 80210011
   mpc8543_v11      PVR 80210011
   mpc8548_v11      PVR 80210011
   mpc8548_v20      PVR 80210020
   mpc8547e_v20     PVR 80210020
   mpc8545_v20      PVR 80210020
   mpc8543e_v20     PVR 80210020
   mpc8548e_v20     PVR 80210020
   mpc8543_v20      PVR 80210020
   mpc8545e_v20     PVR 80210020
   e500v2_v20       PVR 80210020
   mpc8545e_v21     PVR 80210021
   mpc8545e         (alias for mpc8545e_v21)
   mpc8544_v10      PVR 80210021
   mpc8533e_v10     PVR 80210021
   mpc8544e_v10     PVR 80210021
   mpc8547e_v21     PVR 80210021
   mpc8547e         (alias for mpc8547e_v21)
   mpc8548_v21      PVR 80210021
   mpc8548          (alias for mpc8548_v21)
   mpc8545_v21      PVR 80210021
   mpc8545          (alias for mpc8545_v21)
   mpc8543e_v21     PVR 80210021
   mpc8543e         (alias for mpc8543e_v21)
   mpc8543_v21      PVR 80210021
   mpc8543          (alias for mpc8543_v21)
   mpc8548e_v21     PVR 80210021
   mpc8548e         (alias for mpc8548e_v21)
   e500v2_v21       PVR 80210021
   mpc8533_v10      PVR 80210021
   mpc8544_v11      PVR 80210022
   mpc8544          (alias for mpc8544_v11)
   mpc8568e         PVR 80210022
   mpc8544e_v11     PVR 80210022
   mpc8544e         (alias for mpc8544e_v11)
   mpc8533e_v11     PVR 80210022
   mpc8533e         (alias for mpc8533e_v11)
   mpc8567          PVR 80210022
   mpc8568          PVR 80210022
   mpc8567e         PVR 80210022
   e500v2_v22       PVR 80210022
   e500             (alias for e500v2_v22)
   e500v2           (alias for e500v2_v22)
   mpc8533_v11      PVR 80210022
   mpc8533          (alias for mpc8533_v11)
   mpc8572e         PVR 80210030
   e500v2_v30       PVR 80210030
   mpc8572          PVR 80210030
   e500mc           PVR 80230020
   g2h4             PVR 80811010
   g2hip4           PVR 80811014
   mpc8241          (alias for g2hip4)
   mpc8245          (alias for g2hip4)
   mpc8250          (alias for g2hip4)
   mpc8250_hip4     (alias for g2hip4)
   mpc8255          (alias for g2hip4)
   mpc8255_hip4     (alias for g2hip4)
   mpc8260          (alias for g2hip4)
   mpc8260_hip4     (alias for g2hip4)
   mpc8264          (alias for g2hip4)
   mpc8264_hip4     (alias for g2hip4)
   mpc8265          (alias for g2hip4)
   mpc8265_hip4     (alias for g2hip4)
   mpc8266          (alias for g2hip4)
   mpc8266_hip4     (alias for g2hip4)
   g2le             PVR 80820010
   g2gp             PVR 80821010
   g2legp           PVR 80822010
   mpc5200b_v20     PVR 80822011
   mpc5200_v10      PVR 80822011
   mpc5200b_v21     PVR 80822011
   mpc5200b         (alias for mpc5200b_v21)
   mpc5200_v11      PVR 80822011
   mpc5200_v12      PVR 80822011
   mpc52xx          (alias for mpc5200_v12)
   mpc5200          (alias for mpc5200_v12)
   g2legp1          PVR 80822011
   g2legp3          PVR 80822013
   mpc82xx          (alias for g2legp3)
   powerquicc-ii    (alias for g2legp3)
   mpc8247          (alias for g2legp3)
   mpc8248          (alias for g2legp3)
   mpc8270          (alias for g2legp3)
   mpc8271          (alias for g2legp3)
   mpc8272          (alias for g2legp3)
   mpc8275          (alias for g2legp3)
   mpc8280          (alias for g2legp3)
   e200z5           PVR 81000000
   e200z6           PVR 81120000
   e200             (alias for e200z6)
   g2ls             PVR 90810010
   g2lels           PVR a0822010


Many thanks,

Mark.

[1] https://wiki.preterhuman.net/images/f/fc/Endian.pdf

