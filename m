Return-Path: <linuxppc-dev+bounces-1833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A79945AD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 12:44:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNCLX4bhyz2yRG;
	Tue,  8 Oct 2024 21:44:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=85.31.212.143
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728374109;
	cv=fail; b=iShLcAItZA2m8WALyFyril0Vqvot5DXWo8dcVCdbmdZIGar57itxNCvONdnSO0wd9BcOLrdiV9BjQZnQGRgjwgOpd3mllm1FW0JYQetnGhfXJbR0XEsckj7u/ccdUa67M2vqaq8/sXhfBgAXH3fku9nYSvzwQ8+0w0A/3jjxjh5IQR/O+lJmq2Vq9dccLuNK6tAgNMlQZrXlnejRdBvQFhyBa8lVKOhDSpsO9ipl0KrHZGUCXqJgcJBgqIqdGpg6eRPddVKj4HIfZBeuKO8f0H2Ob2odtv59fN0XX6oWfZ/3zKfVA2gE2Ak+fOtQmXpbiXPvvCmqrvPNFnHF/goZzw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728374109; c=relaxed/relaxed;
	bh=K9ZFyA0Zi/6tbiQ+FLpGDx2vpwH16o5xPtKmXUrQphs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TenKdKuKMUcah89hEDR1JW1HO+M0Fv8klN9ZKQw4daYV4aD7Vqcrrao0sL94TDWpx8TsdN7HXiGZeF65lDK1ddJSWWqX/zGZmSo+y4wBU01zrWFWL7TcPmcMLO6FAwLlz52ImOca6NXv3L9EV9O1FaXsl2WpdJaxZKp3IJFIGBRXfmUAJU0G4xvFYoLmFVeKCNoTUQ0+IGojtzYeF/IhrAneXWEL0Ukfzn08kYKtM/8QUjcYS8z+hoJLH35h8SrNanh3P0yGKdfZD1XTm797Dg8pJQcARnZFAAkGDhjtF6CgSRT3nWQCc/0h/Ru/vE1ns3XNTR718ep9bQHA8rCAzw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kalrayinc.com; dkim=pass (1024-bit key; unprotected) header.d=kalrayinc.com header.i=@kalrayinc.com header.a=rsa-sha256 header.s=sec-sig-email header.b=f0x9Cqxq; dkim=fail (2048-bit key; unprotected) header.d=kalrayinc.com header.i=@kalrayinc.com header.a=rsa-sha256 header.s=selector1 header.b=dEd0Bzns reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=85.31.212.143; helo=smtpout143.security-mail.net; envelope-from=jvetter@kalrayinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=kalrayinc.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kalrayinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=kalrayinc.com header.i=@kalrayinc.com header.a=rsa-sha256 header.s=sec-sig-email header.b=f0x9Cqxq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kalrayinc.com header.i=@kalrayinc.com header.a=rsa-sha256 header.s=selector1 header.b=dEd0Bzns;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kalrayinc.com (client-ip=85.31.212.143; helo=smtpout143.security-mail.net; envelope-from=jvetter@kalrayinc.com; receiver=lists.ozlabs.org)
Received: from smtpout143.security-mail.net (smtpout143.security-mail.net [85.31.212.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN7bZ0qd7z2xyB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 18:55:05 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by fx403.security-mail.net (Postfix) with ESMTP id 9A8EA8A361E
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Oct 2024 09:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
	s=sec-sig-email; t=1728373892;
	bh=3AxsVeCyHM1dVhXKl6G17gxwdkd6EeDtQYn6P983bEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f0x9CqxqgkCpj8BYlUjEICtK3YCnJP6MSk6bCGyL6XprA774uGbCiQ8uzhOz7vjEV
	 ydH4WI8Y7fdRV3YNoB9eLx4LSB02Ktdi+CV6qgMAAHS3n3XBU2hyXekpCfBtjaH3Ke
	 1WCrOrCnTah41wMGDkRHnfYyyjZNMRymLJvutnQ0=
Received: from fx403 (localhost [127.0.0.1]) by fx403.security-mail.net
 (Postfix) with ESMTP id EBF728A2CFF; Tue, 08 Oct 2024 09:51:31 +0200 (CEST)
Received: from PAUP264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp17011029.outbound.protection.outlook.com
 [40.93.76.29]) by fx403.security-mail.net (Postfix) with ESMTPS id
 DCB618A2FDB; Tue, 08 Oct 2024 09:51:28 +0200 (CEST)
Received: from PAYP264MB3766.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:118::6)
 by MR1P264MB2194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 07:51:16 +0000
Received: from PAYP264MB3766.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6fc2:2c8c:edc1:f626]) by PAYP264MB3766.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6fc2:2c8c:edc1:f626%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 07:51:16 +0000
X-Secumail-id: <909d.6704e480.db32e.1>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=no1LD8O8Gu1wHjs33QuYXpTY9devGRhN8iHU0q81bw7XDZlX26gTTVtHJpTNE4X3g0XysaGGK8OrwZldoSts8EeI8FYay47glwSwTLDC0JqlshDyw4ZLtSlG4GSXS/02dpcJv08Zl1nuJq8oP9N8gOsdrcHogg/TBcH0nqVubHXx9i1pqC2Ike1qyjRG7bvo0JFwJES58pUr0XeKsdMgbMejhw1amz4PZCnw18vd91y/3NRzFXAmpJsF915EFqqN5D+gVuP5DttR1u6EkX1UC98GPb5q8DcOrHvFarF5VI2HjgBqOWJZlEqBwUa3LT480l1c1GPB5grG71WLxEnEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9ZFyA0Zi/6tbiQ+FLpGDx2vpwH16o5xPtKmXUrQphs=;
 b=Vfj972152wzHXrz6D17sr2HE6vlh8JIkVcRYMyu0T15mvFv2PigcwIGGx9SfjhxPQqMsn8DJ4Hce6fyNyjvAPpp/DnKTZTSqk4J87xBeph2/XD/a9GfkI6aA+JO7wEcBgZbuTto5RwcMHNYaRlBJ9jvMMkt4AinhGlue6hDRPrd6yAL8PcRxHWx2L8lQXbXcFmZFFTj0Af+og6L0YHzbAzPNOb6goAc4vCexiSSIbhZuhyiosnk3WZi42hS2Vn5Z1gKXGLlEWZK+JIrvqRclUOUBB7IBJ9Kr/ry0TSxAX1wLOlebzooQz5oWbhy1plHv/SINbQ/gZac503ko5E11GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9ZFyA0Zi/6tbiQ+FLpGDx2vpwH16o5xPtKmXUrQphs=;
 b=dEd0BznsGL33iiUBFFShYf2r8CK0U/B504iVs5WbOPCSAG2xS/QLFdPkwoAFSTpBy407u8LmDcoV0mgJjzwFwmobO+FsiD4xUangUR8nJa800dVjctbTfDZ0MNG1JbzjqFia+KFcjVvdNyasljUVrGXSXh2tBE4tip8SAN3dGjUAGjVGBXUcg6erOi92ajOP3pL6XmHkAvYTW7sA2l7Vbcra30fl+0QB486AOTd7EYdzv43KdmhCi2U5jdZ3zX2oze3QpiYQ1FQwynR7F3LBjRvyJ86FB+LjIk2wZYii5NyEHZdiBhVfACKHZxUGwwjstX++69CsHRKXVCl7FAUNFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
From: Julian Vetter <jvetter@kalrayinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, "James E . J . Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org, Yann Sionneau
 <ysionneau@kalrayinc.com>, Julian Vetter <jvetter@kalrayinc.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v8 08/14] sh: Align prototypes of IO memcpy/memset
Date: Tue,  8 Oct 2024 09:50:16 +0200
Message-ID: <20241008075023.3052370-9-jvetter@kalrayinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008075023.3052370-1-jvetter@kalrayinc.com>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR07CA0019.eurprd07.prod.outlook.com
 (2603:10a6:205:1::32) To PAYP264MB3766.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:118::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAYP264MB3766:EE_|MR1P264MB2194:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0da2b3-83f9-4958-49d6-08dce76dfcd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: gHwaJmYLXhax9i1aUyhAL6E2ijzL6hPmclAqFwURiljZl/Jaz1QWAS50aqb4kdsJFqiFhr8IgwL/yMrZWfCZcFPM6bF+0W459Z/lpPMggTWB5DjfBksOYG5AOmpw9d9ht1f6LWcLAMpvRjJkMUeTau09ZQ+77DDir/j4Di35B5c6loAvl//KKFoZobEcZLVfST7EFc0TbeO9m7GEStKgefDa9NAWgbIqcc0mIOXTSTXYQMaf2YpS5WjteGUrnURtYYUM1SGRO/3O72HNTML3nSXx/zxgxwWS29+YHAtVQaiOExtAYagr9d8Wxdj4oUTCXz2VZMw6wJKC83G8UODocZ5I0tKhZ6Ssr8C07TyJgLNuSsvwVRPuBUHUQqy3t8YISHPt+VncWzh6C0L2Ix7GzwB64Q+F6ezMs0hloIaWmyuMKGarBZ+8OP0TCCTmHZa6i/BHUSYFEtqjVU5jW/i7IUJnSZVo949pZti5peMo4nS0THtRTHkmPbkmeoe5X2odQGS13oDXp/8sPK9cd7NgA2GYUI+gEfqx42vMOSxH7mUu2DZ6A8hTPDt6zChuB3JB04fTPeQTmZpH+MY01nBKaew8SJIyb8u6CMZ8Wnhz7T/Tz4YPL2VRGE3l/Voe84zsu8XtE7IzBCEV6CBSGHDKhQP/bci9NifKV5ZIBvI+vsDUpPzLRoTDpbHxlOt6kujJ401lvXVG7jj/4mBThh9K9MrztFt7aJGeudaXupRJvSJkPT2Uxm0+ZAd+/FMcjQKlFU8lBdc+HDZVORJ3OtvbopGRSh539QT9N3U7pmJK0J11i0OuHOnLTLicauVWv935SUXwtBrU4msavKUKhl+h3V3ko2bL51VK4hpeEe4LGkCT9Ou5EzSUmlm9iretn27Q7qaRi8xFxWOAX8Ynk1sOvm8vpGLw4g7Q3D4p16N89S/kc9Bc+JcnIzdA+du6FRh2Ze5
 AwGOJFLqxoJngSeYzVFhpF0C0foyRN4Cf2F7YHWKBhor33csZOrfFQxoUQvN5uo3lpSm+OwcqIsHNj7s8YR4V7ic3uiQFwrfJgdMX49+TjSwNuWKcfG3GoSTjUJz9gtRR7BaYNwX7k9J1VXy+kXLgiPh3CqMPSo0saD1EcqaI2yXDpOcOTIsTD8WlFyujlTGZRk3YtPMBdTNdeFjXEauWHWWMD8k7oIDgyPhjMmwJuxEQpQwj3jUx/DyaK8fEd6PWMgSSbmQdgQSxyN0vTAkym3sL25wSRntSyKk+1iWU2eBsRFxGWlwLieuPJLEr3kNX0w2vu1x0n++JF4YvSjAsMa9NMBzLzuRudZbWu9o3u+sJKEuH/MmSbfJbDDbgl+zx2jMjokgiSnP0//0qtxgGYp1f3Ft5ywVsoBQ/eac=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAYP264MB3766.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MJ/cE7Jqq76FkP1NuTBMHKZCFEK6Bb/XAVjpz4lmfDa5oTSnCU3HQSESpIKcr7LYhubK4xCKTKoFccVBnSXEjUMBux/RrtR+0xP850naR+tCn+tqImIly6DyZPWdlq6KVaPDF1gv94Pq6oHwOyYMbq+5/6ImPGaoy0ajmuFFTFCAUlNopHTEdObpkB1jM+/zC/LRerEXaRMVgsYnjNlB3U+MsB3vHgAVlrTy/uoJoGA8ClfCKizUXuIzqxSG13oKuTPTBg8K+4gdq8yyFrOPDB5eIQvjxSR9o9Oh9+JMU4X4laEfrbfsyJ5Yptyxz4VAC2gfHRVr1ksCSoqijrV9Ga7nKu2eMwqiN6Q8jFj9glXNpr0t3d6KFEa6sagTfADlohpuSjX4VYFTmU/g87HryjWtmjZ1C9JnSTZldNPODlsPs0XFtsXTc+11zBjt6SDOLwgmW6h7d+LWUhayeAvZF5ShziaTXrI1rzV82IFbPzwTKlwB4MOhnFa4mHQso4wCny2tazN6AXyIwZycd5F+blhQc7KqaRrgrHGvqKDSOrL5DuoMY0b6CAHzRyuBNUNUtjcMtznH/lr2yIvNw/NS8TFls37h6LeWKPWj/IXEX+vfo0SOKUPf8MaSYSTbjdSnJyiYLAAnhCxPoQL/bWKDMC7RO9ayzpPoADWqdTxYCgOJ+PQ5kTOZ9Npzu4+PK9QAZz0nmTcuLClJN9Yu9a5r25aM6VTop3gwfktoMzfm0KLF42gy9OkTW8rAaasCHMN4Wwqb5UevX8M4QarqKZHmiRDgMy6xKlaCSGiH4/DWwposm8seZHDVvCFl9oQsUywKBqggrify0lvahqL2lqJ8pQWmQsNmI4Y6rR+GKlXEjr6J1T7kheqI73fPicyqlSBOLZ9ZyKz0ajzLupSCM2Ys9Lq5E7HgFzkO3hZ9wM1pIfyJedzf6GpPnMYmuEzvIHY1
 6SOJ3kxjr0I2VRr7RA4SO5nMd1KaEcAVO60r88lwpVdIPaEh+WdL90CDyznnNeQXgVuFXs0pQt42dogY4kCsgtN7um4dOguRX6yIZXNmHxj0KHZirHnk7v3j3pfYhFS/+TCya4LPatZAVSJplDuVZ1aW4aGeP0vODbZ2AXSjeKo3B95slmaSWG/SGPVa4Fb5AZIB4wVdsb2NlXk6H+V5wVjKTFriG8Am9zkRrzB9VmV/6AzbcStCpKgxPFULNkRa5N6PY/yXlzTRZ/o3hHnATXyMjaJjE9/jNcq/MvhfGcEgRcbSntxEQ9/RnXG8VqFFgnNGcBuhBkg4loPeWhr6BeKGGODT5WrMcnMaGs7BCjGthZoraIOUPTUj0X7quBHltrhhpb7Ebm+dizwU9Ovgaf351TGzwNwUy/E174VWaZr3kco9lo7EcM/JRfPZxEsVNHuPKSNON0xKo8axo9FXrTvpTR9/0vwN71SBESRSdYyjJTIduIbndSNqzjDG1x4BEmanzAFYiS3XBuj7dFwb80+N0ScZP+nt/BpLVjHW1rvIXBrfhDspHyjWBeSTcGy+x8F4NWg2lQIWgf1dR3Pl43eh//oE5u/k1867aY4KksfWeweJp4aqMEE5PjgGbQ9d
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0da2b3-83f9-4958-49d6-08dce76dfcd6
X-MS-Exchange-CrossTenant-AuthSource: PAYP264MB3766.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 07:51:16.0326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5zQc92VpeWQZLQdannYqiGXEzsviDtGCAYVn8M5uWrQTU+qZ+XD7LGcBDbpOaeGBRm2kjiTtkdqUQ5ISLolCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2194
Content-Type: text/plain; charset=utf-8
X-ALTERMIMEV2_out: done
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Align the prototypes of the memcpy_{from,to}io and memset_io functions
with the new ones from iomap_copy.c and remove function declarations,
because they are now declared in asm-generic/io.h.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
---
Changes for v8:
- No changes
---
 arch/sh/include/asm/io.h | 3 ---
 arch/sh/kernel/io.c      | 6 +++---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
index cf5eab840d57..e5c780eb22d4 100644
--- a/arch/sh/include/asm/io.h
+++ b/arch/sh/include/asm/io.h
@@ -272,9 +272,6 @@ __BUILD_IOPORT_STRING(q, u64)
 #define memset_io memset_io
 #define memcpy_fromio memcpy_fromio
 #define memcpy_toio memcpy_toio
-void memcpy_fromio(void *, const volatile void __iomem *, unsigned long);
-void memcpy_toio(volatile void __iomem *, const void *, unsigned long);
-void memset_io(volatile void __iomem *, int, unsigned long);
 
 /* Quad-word real-mode I/O, don't ask.. */
 unsigned long long peek_real_address_q(unsigned long long addr);
diff --git a/arch/sh/kernel/io.c b/arch/sh/kernel/io.c
index da22f3b32d30..588771cf9b7e 100644
--- a/arch/sh/kernel/io.c
+++ b/arch/sh/kernel/io.c
@@ -13,7 +13,7 @@
 /*
  * Copy data from IO memory space to "real" memory space.
  */
-void memcpy_fromio(void *to, const volatile void __iomem *from, unsigned long count)
+void memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
 {
 	/*
 	 * Would it be worthwhile doing byte and long transfers first
@@ -76,7 +76,7 @@ EXPORT_SYMBOL(memcpy_fromio);
 /*
  * Copy data from "real" memory space to IO memory space.
  */
-void memcpy_toio(volatile void __iomem *to, const void *from, unsigned long count)
+void memcpy_toio(volatile void __iomem *to, const void *from, size_t count)
 {
 	if ((((u32)to | (u32)from) & 0x3) == 0) {
 		for ( ; count > 3; count -= 4) {
@@ -100,7 +100,7 @@ EXPORT_SYMBOL(memcpy_toio);
  * "memset" on IO memory space.
  * This needs to be optimized.
  */
-void memset_io(volatile void __iomem *dst, int c, unsigned long count)
+void memset_io(volatile void __iomem *dst, int c, size_t count)
 {
         while (count) {
                 count--;
-- 
2.34.1






