Return-Path: <linuxppc-dev+bounces-1831-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F310E9945AB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 12:43:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNCL36HByz2yQ9;
	Tue,  8 Oct 2024 21:43:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=85.31.212.145
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728374108;
	cv=fail; b=epZL4XH19IyhL2Fa4MTzK4IxHvZ54g7Lpca9XUGXZFBYQKZ1HDaRRjuuLMM4rr1N32HWFiMiRgh4CegAYywnQcvB1gSnC0sSqrN5VXxOAnBT10DqK01MNudxbmY7RSjZYMO/09SwvwhsH3D8/CtDgxguta4GD4WHYBVbDLfWSZnxfyzuI1E8t2x/mGxHUHlvcoAdDbLUgyVvOOEFEROOp3Im1Vz+Aw6qQxdZjjCwiUnT8Iqj3n1a2xogbd6bdPCTFoRaBH/rGRTvx9zv1COhOw/fDBa0GqiZdGVv+asUKIAhN76sMsU0ap38Gvo1ZRu7Jz6GNkVFqVZiziSYel5CHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728374108; c=relaxed/relaxed;
	bh=MDnaKk0Zu2uRUJUJIaFrEIfQZw4RUJ8OEETWLcJkAIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ks/fEXRRETEFHmmGAtuRgxOAz/bcWb3eT+BEWX8hYFm+NGG7isCzV+A0FsTTjk9yUAomgW7sivSeV9ZYVDSRrjiTNYDSCKH/q566+XqjIlNRdXRmZJHD2O2lhhdMBmKldW2mfe04kvcJmE1spwFauL4ZW5aPwL3SUXazMf0RzAfdIwgZO7YfP7QtD7z5UVvtAWZQSgl4Rof2gHayoqTf6Lma9sRGOw9FJZSkBoQpU12Mvfy2QB/BOdZjW7qAKw7JVg+1jWILVjSRNDJ0NeD6jgCn9PCUXktkscm3/VWAn/KEOEG5BYovoG8EY1NRbK8gujLnlHkotJPk84yoWtbdnA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kalrayinc.com; dkim=pass (1024-bit key; unprotected) header.d=kalrayinc.com header.i=@kalrayinc.com header.a=rsa-sha256 header.s=sec-sig-email header.b=i4oa152o; dkim=fail (2048-bit key; unprotected) header.d=kalrayinc.com header.i=@kalrayinc.com header.a=rsa-sha256 header.s=selector1 header.b=fv/UTuli reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=85.31.212.145; helo=smtpout145.security-mail.net; envelope-from=jvetter@kalrayinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=kalrayinc.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kalrayinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=kalrayinc.com header.i=@kalrayinc.com header.a=rsa-sha256 header.s=sec-sig-email header.b=i4oa152o;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kalrayinc.com header.i=@kalrayinc.com header.a=rsa-sha256 header.s=selector1 header.b=fv/UTuli;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kalrayinc.com (client-ip=85.31.212.145; helo=smtpout145.security-mail.net; envelope-from=jvetter@kalrayinc.com; receiver=lists.ozlabs.org)
Received: from smtpout145.security-mail.net (smtpout145.security-mail.net [85.31.212.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN7bY40KLz2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 18:55:05 +1100 (AEDT)
Received: from localhost (fx405.security-mail.net [127.0.0.1])
	by fx405.security-mail.net (Postfix) with ESMTP id B8A93335D8E
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Oct 2024 09:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
	s=sec-sig-email; t=1728373875;
	bh=hinrUjmTJyMFC+GlrSoYvq0PtBWDs1LfJfjfukhAmZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i4oa152oKcDqxwfbIAZv1j68KINtERzy+2Rm/X1buW2I6iQYvQEndhJg/Kw5ua1Pz
	 dCt6u8lLKXFYdZrPRLOiW6gFgKRZSUOHBrNhZgRvJWx+DjEhXcuJ4rxW1Yxy2NXcwD
	 7ObJqIjBIpjj2tB1KaYwSDunvmK6uausnwVD3/eU=
Received: from fx405 (fx405.security-mail.net [127.0.0.1]) by
 fx405.security-mail.net (Postfix) with ESMTP id 5F095335C20; Tue, 08 Oct
 2024 09:51:15 +0200 (CEST)
Received: from PAUP264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp17011024.outbound.protection.outlook.com
 [40.93.76.24]) by fx405.security-mail.net (Postfix) with ESMTPS id
 E5B24335C96; Tue, 08 Oct 2024 09:51:13 +0200 (CEST)
Received: from PAYP264MB3766.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:118::6)
 by MR1P264MB2194.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 07:51:12 +0000
Received: from PAYP264MB3766.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6fc2:2c8c:edc1:f626]) by PAYP264MB3766.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6fc2:2c8c:edc1:f626%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 07:51:12 +0000
X-Secumail-id: <b7ec.6704e471.9f783.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfMRiSnZk8ARdyawIQBORoqJpB0JPUaJr64Sz4bRucPkKASnVIb8U0XJojNk0c8djd3L8O2lXlOdYi8RpvZV6oHT6Vq8DEnMp00DiqT6jz5HWdJUJAOsbYZHg9q2ukoEkudg1c9bYbk5asgr41IxEjidClVr6JWi/0AX8GcAHccuO61WBRgd2hxkJVMnma7W12f9fSf1y8o5wygknWzZF/U+3XJ5gYlbjqPh3JF3lN7nTDXFdUFebqRwzBV7+b38Mnhw+NinOa5pQtDhC7NQ6IoFF3T819bxGtkfcTYC6ISm4y3j1zHLcfj3U0arun1JWpIAIv7aNAqRDzNHX1hAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDnaKk0Zu2uRUJUJIaFrEIfQZw4RUJ8OEETWLcJkAIw=;
 b=Lj85ZUWyDZcbdqGga/zGwkBCpOfFVVJAGq5sgSMih5/qIK0KeLgbIO/KJdi8JP7cVGnFr6B4Fq/k2NeGb+X5BOXTY9RDLMqoNAq9XgQTbX2lHShnszKTdWu/8kNC3oVyfpbAz5jmgcWHquDxhuVInckqenxn2yp9wV67dN4LosP3OGCLejoAl8VctU5OJbD+t4EIVtOKViVvQTtV+C8yLev97jpwurDqskT9zLES0qQjp+suRcpHkvxemy+eN4IeG3xtfsl+qaBLuxRU+9C0OZ7xDFCswzsN5Epg4mfbsIINrB4WL/zoLItsdBX/DIz1EbYPOrurx7FCW7Vad4JEHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MDnaKk0Zu2uRUJUJIaFrEIfQZw4RUJ8OEETWLcJkAIw=;
 b=fv/UTulirp05NevGUWA6FS1IPV745crJBd9rtQH/TjWlOkFqDKXxJbHfyJYKRGkOJPmcLNdqPytxGDCdUWQLtX2yhVjMRYUSWP97iFHfmPOf7qZN8QoxIJqgNnQMc/zRxZyOQJueaP6qertr5IJYx2Cr0IlVZCKXhVj1UI5VtnU4gTQq7nh3fLzPJDuDnLQR0nICYBvWJTvJmvrHJnkTqLeLFw9eA4XcK8kRRJFKnF5YjX4QKQBDNVQWfT24CAU1gsndFcR+SdcZDv5M5CwiiAdtHm1Ra0KLwvXQD7sPS/lOfBZ/EspLgblYbKFXRgryM1Ij2CZPwLkouZG/f1dbXQ==
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
 <ysionneau@kalrayinc.com>, Julian Vetter <jvetter@kalrayinc.com>
Subject: [PATCH v8 06/14] alpha: Align prototypes of IO memcpy/memset
Date: Tue,  8 Oct 2024 09:50:14 +0200
Message-ID: <20241008075023.3052370-7-jvetter@kalrayinc.com>
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
X-MS-Office365-Filtering-Correlation-Id: 293b32ef-b983-4ea1-1e9e-08dce76dfa98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: NQhxMmreuPsD9jenC8sUnZZuDqNjJDGzCsNeGS9/tXEw5i2uIA/dFNcQk0qEyUgcOc/8mYNtqe7wWNuF7DA0frfBn3mCJL+ZRejHShRH7WS2awHx+mL/Hr6pTgJMPjEKvAbUn+uELkRirvKPfxsIQeNb5W3cDHYQMS4nKlSAaHK92QLRntmYUyXs0QkZ4g7I/f6LMKdNCM+VUFvjmxyZ0PkhPlOOstrwcqt8OhvOF8SwNGQh7XYEDiWGmCrp1R7QS6qqZxWpPof1dX+GQc/g4+V+9qjgss/h5Y/FgY1IYCpt1Ik7H0csLxF5ti7GPC1k9P8hKud5XgRKND4dxykl+V4IJnEs2EhKANpNADCxdq5ejgT/HGBJXs28yR5f99BeTlers0Mxqs5QRIIZHFy7zw2rPO6aEqYoe6JKh3J9sg4+hlfRQOxdZBLLr7xj2oLYI+YheemlCCujEftm6X8GEyKCIkLtV9FBfD0DMHf08Pl2SFJEzHGLfCRfnzNbX7EcbjgBk7NipFyE6bg5waZhXHWhNKH6viDwQ56X5MNcLrA4+gwWGJDyzySP7Eh2PlZdQLQ2GSsWrp6xoBVISCQTyrudpeTGAVbA8NHTcJaO9XA1w6IoGbFUh6V8E/08pc699H1rRU7v6D9ROeKcLN2Lo4SWGItEakk9mQN1iRvkH2g6mw2qG/+XG59TfPYnUiNwadOSTaERL4sf4zxzQC/QYKLqQPcCHs9i9fvRiGqh+N7Q4miZnIZnfO2gR8S4r7CQvuq68kJGrC7CFwJOsCKjDyKB7Vq+USv3O6DPjW0T3ZT0eF6oNt3iT82KL8RSp4c0zMX68WRRpxZDq1kiVvr4kCL6IqXP+3cm2za+Dp3G63+YmpH+L0r+j7THp/5S/Wzp4Z9e4QOqZ0QaaVHaFlF3bvDvP5jmQA4qoqyhmYWdvkFsKdJaza32xVio4LYbWxi1TQC
 O0yYwA37LM/Ml0NnX3K70s+bbmg+Qv6FNI7Jc7Oaj4FN/CMzUeiddoHEP3Eny6JW0XIUwRoVarO5iZYxmmL9BrmGuaKgJXCVlxLnj2eT8arxvHDhNduUGlrRTQEy23hk84LkHBGLKb3nPkPFlmYaNKCNXvsdDym+jbzRHK6RU+3C7gKf4FZ4l6hKJe50aM4yM6Hcvz7ag3Li2C3DpRiX6zckSrRIFz6OTTEIa1LX3BJ+BqIezMXjceu5IYdZF3jSjB1N1exVGnt0aG1jJ/6uUDtYa27LXfxier3YWEHQqwUpAc70PgBNXSht5cYnwqRSWETdi7oqopan975VgETROlAuXUrP2vXiHeXgoQ6Cou6SPvrm2Yf7A5+NOzGAPgAKYPEt8k/oHTVaP8SRJJWeQPKxVhJ70tksf8MWf1XA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAYP264MB3766.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VwgAgWVrRxvijl/grluZNEGPGDE0xU9VNbJWW+Rq0Vv92XIT4zbB7PQjjQXiVGg4OF+51bMOvxduGcE8lIP06hxuIYlW/UvwXtt5TKog7SP5FPwccX+IrX8UX2nN1KsBpxXNecZmTqJ9mW20sQFtvfVUXBaYtJzOpChbTgzELTLTs1RvrptPH/iwKxUKt0psM/OWEubmXQIK0QJ5CgZXDSYwMQLIL2I9ShIC/GocW03kmHqHlD92xkzVp4GZZzYO7sbpn0adV6tXz3N8TKK3IG83E+HWWXAKprRI7uMWnu2xV2QhTGq4cPkjebCJpYXKkw+6p/+K2QSH8T7ifNU9kYZ8iAmwz2JpNxiT6Rkx7kbTyFhIa0fS1Vz9wgvDLeLUIEPuHbULMkJiS5rciLuBQGI9C6U9StSETudJAxMfnUypW5QwBZQvIgV3pUUhCHeOCRUzB3xNECV/5fDScwOsCNwLgF69KiAI89Mp1H2eR/WHizB6IgVNVpEt5PnWS9irVCacqbTzxNWBKJ/GZVeN+YXlGZJuqfCxroPk6My0nnJNPzx1+se7tI4GBs8IMtCR+g6S4ruoU2VqR16tnEBlCtzQE7pn9Cius10puMfaaDxG0yXDNk1NbZHBFAR5N1xbY1lUh1UGwN69cni2iPvrWOz6sQyYdXKLKECPr8LIeWrYcLwHzLlVqQS3OeElYr24C3E0nEOAfsjWPslWcjd94u1VmVmQ7A6P3ZjXn9qPIELigZR86j0wgAzMWyThRVZpIpLyOfKohfZLsjHGiLAhzMi1eUy4ynCDoCMU7su7x9dtctDPp46JJeN05s+Yb19FW2WSlKJEcS94XgKevhQVnWm6n2Vsh+yMy61T+eeQlTDjgK8RrTbr3xL+aMSJfBhqXAgMi7sLB31dcP1QsnaC6qbFe3CoKUktBBhgEGuC7zLviph5mdFHplMDZEBCZeGd
 WVVPgLTQuHsnsWtS71L4Qoa00LnOwQPdQLTxp/ujukK1nTrkxi8zqSqPXhwAIoJmHKeGJLzhiqku/dvyc80HGS2pTqiAWkkOsKaE3xLwNd1WCYNdWeJWEI+p8aX7zBWL50BZhx3vEcMbXv3pTwnHf7c3XgEmKAUI3JNvcMI6QcIasRgWkXKqkpLS5QXLAQs5ocOYH+Tfxe8er7G2gi2zP3LUW1Sd60gU8ncOHMg9AzHvpXkDLvp1YxhbBNxiIU18Na0KmZs8g8j7p8r6Hbx+mRdrPr/KdLOR2PPvP/XejyRXPGrGET/68948v+w/+N02bzYLoY8s4lPTOBYNxqMZNMFwtKRpJLKPJS9Z4qy2jOggmf6kEhT7rcw7xdrcXQQDyO6OiOpng6Z+rL1MQhIeiM8NTLyMMD7ARl/UJ025Jvc8LilEgToA46MB5KmySSL+PvW4p6oR4gxGzVEoV3BerMAcJRpRFvH9qcHov4PdIGOzLL88w1eLwBVTfyt7Jc9C5/10V4dQQ8fK2W6a/ABYfGho5qDNrXlKfE5+8mbgoOJAqMgvAwlcWH5BAXNNWOphS3mP9LaHwWjTZPJVbx3qsT6Xq7ao865g0UibOKeFCl1vT/wzKzdbFkarNFncgHJK
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293b32ef-b983-4ea1-1e9e-08dce76dfa98
X-MS-Exchange-CrossTenant-AuthSource: PAYP264MB3766.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 07:51:12.2963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBLUTiaqh7zUwNF3cxPQeC2EKQyfQ2Jj0y8HcYlLWMQYBP5+w9tg1/yMzzVfPXizVPbUYqMVLCNBc7v9BbyM8Q==
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

Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
---
Changes for v8:
- Mask the argument with 0xff because now it's an int and not a u8
  anymore
---
 arch/alpha/include/asm/io.h | 6 ++----
 arch/alpha/kernel/io.c      | 4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index b191d87f89c4..e7d52c8159b0 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -591,13 +591,11 @@ extern inline u64 readq_relaxed(const volatile void __iomem *addr)
 /*
  * String version of IO memory access ops:
  */
-extern void memcpy_fromio(void *, const volatile void __iomem *, long);
-extern void memcpy_toio(volatile void __iomem *, const void *, long);
 extern void _memset_c_io(volatile void __iomem *, unsigned long, long);
 
-static inline void memset_io(volatile void __iomem *addr, u8 c, long len)
+static inline void memset_io(volatile void __iomem *dst, int c, size_t count)
 {
-	_memset_c_io(addr, 0x0101010101010101UL * c, len);
+	_memset_c_io(dst, 0x0101010101010101UL * (c & 0xff), count);
 }
 
 #define __HAVE_ARCH_MEMSETW_IO
diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
index c28035d6d1e6..69c06f1b158d 100644
--- a/arch/alpha/kernel/io.c
+++ b/arch/alpha/kernel/io.c
@@ -481,7 +481,7 @@ EXPORT_SYMBOL(outsl);
  * Copy data from IO memory space to "real" memory space.
  * This needs to be optimized.
  */
-void memcpy_fromio(void *to, const volatile void __iomem *from, long count)
+void memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
 {
 	/* Optimize co-aligned transfers.  Everything else gets handled
 	   a byte at a time. */
@@ -535,7 +535,7 @@ EXPORT_SYMBOL(memcpy_fromio);
  * Copy data from "real" memory space to IO memory space.
  * This needs to be optimized.
  */
-void memcpy_toio(volatile void __iomem *to, const void *from, long count)
+void memcpy_toio(volatile void __iomem *to, const void *from, size_t count)
 {
 	/* Optimize co-aligned transfers.  Everything else gets handled
 	   a byte at a time. */
-- 
2.34.1






