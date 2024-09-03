Return-Path: <linuxppc-dev+bounces-931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779A96A792
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 21:42:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WywyK1Q3Lz2yNt;
	Wed,  4 Sep 2024 05:42:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725392569;
	cv=pass; b=EJPVzH3BmZ6Fhls1OBVNgGknEjSB2aAShX5RbqqRB8bi3YVFHus5WdyIHi4XDo9DfcOAGQYM+gaFlBJ6CskOY9NhoFb/EeqPZQMazJeQ2ky74eHsXMhL7iZn9dpUvC48Lw5FWRoPr05tIS9lwPT80l46NLG/M2vGvz02FEz0eJmqotIu7LAJa/r4rEVBMoNbl6v/vH0laU0BaIDRhox8MuiGV5kxmwvBesypVnDD2Tfc3XptE/nYMXDH6CywPYLlkB9o8KMntsQ+Q4rZhLE0LzfJwwJkA6C0iQbErCTWQtlZgid+lR9LtvDCWl48BU8on5WiwHpqiCqLZKE9CGtFYw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725392569; c=relaxed/relaxed;
	bh=at2oxG6K71VZI5x02WYMCXtB3BUn5yM+0yTtAT1IY4M=;
	h=DKIM-Signature:ARC-Authentication-Results:DKIM-Signature:Date:
	 From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZmPJW1Mh2+Tv4/DbgRL+lcktoDSwN1cgiTmjiMmSWMceDp8JuWNy+ySGXLI83kgZ8HLfhgTrmuFU6rM7bnz4Z4T9nXb9oqwHwcuP/uWj5BppxexZJvsdyTTVL8nos9mD47v4NDl9loAAuIzV5hMghdBYnvvRCtVQFsu4eCoL+/HKFBw4u/GNVHJFomIwZ1R4I5Ewz5GMesQOLCAAblQM+EWPGrgEd6rZx6WR05GVaUbbiiD4JkpGvjBE++zdLQjhcbH9jw0n+mgnd/TAzbABmak+MThYaQUwhDnQcGeBaXqza07R30rJzal3/0Ue1zPZR+HVZZ/QJ+l7XrqW4AnfAg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=WCnP9IX1; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VEH2QtUd; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-11-20 header.b=WCnP9IX1;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VEH2QtUd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WywyJ45B3z2yNn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 05:42:47 +1000 (AEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483JXTDv004501;
	Tue, 3 Sep 2024 19:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=at2oxG6K71VZI5x
	02WYMCXtB3BUn5yM+0yTtAT1IY4M=; b=WCnP9IX1sxMlCa9PuEWulfumAnQc3AP
	LtQePRkV4+kPsfenyAUd2hr7KyXcghqSBrsEcsd7l5TC8xNDBZ2xigvNTKp3gOga
	+gOmN/E+LQ6JQkuPiD3CQu06BhxrgBZE9ShGJknc17KztWZHtZkQLJZplLS6Rcux
	ayxUbJL2oKi45evggbURfQkzfNwOT/pvAQpwKjkpgBaORJBMwuGACX8z6z/uJKVu
	fxjQkC7K2aCIGuTN+xxi2TfFGoPSLissAw0I8KT3zoh3Iaisnix1FMKxqETfSNGG
	BOLP74aMiehFZJwiD8ga9g0Fn6tvgo0m93jnfIYaktu6wDDMZlEbauQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dwndhp68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 19:41:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 483J3SQU018369;
	Tue, 3 Sep 2024 19:41:57 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41bsmf5utt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Sep 2024 19:41:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FT6JssJhMhYEBKV69tCn7PwBWYkoU4tYJ8BuvMVmHkMGnLWy846kmj8mAeVdGnkI06ryST8IPqBSq6C8/iv3TaZu9B8rgDVGAJq87z/m9jZ/GLHmmMPeS+yLWtBUde13saxDiMtmbnQ+4I3ywxHwtGUn33S49bTXo1zgir193YhyjJDGOp6oDQRR/bxdzKiTO8oUYfVo31T9syIrXzySZkgIKbahvFXyfIWuZoEJb0kLgrCjsOTI31kTmUJkTnSO2Zhxf703TuyJJ47foOsSHJqk5gqg0IAFjfPOtL2SvQQNP2iQfzashZheNqQsCbel5mJ9HeauUx+N0T2UB9aglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=at2oxG6K71VZI5x02WYMCXtB3BUn5yM+0yTtAT1IY4M=;
 b=OO9rbL459fIQ9LV3KIIuggbaFBpdxrfqhA4lHZAqV4l/qANsnA4l5H92LE4JFrow8NJrjrlGBoGeIsiDuYQW3CtIFG9c7U0PB/8gZNfj8uiIT6YgbgXAL9yVNB0JiEV2FidMReE8zTgeoWjASt+5zXMWC+sTfeAvZe8RzvnM0hI2dNXA9ghL0f3CaEZZznO/LSM2/2ok904492+BabHnIZ6Z/w7TS98uXvlTNWwMouOHOSLznSGCOGgYW/LAiuce6D5+vwfdPmO7ly11m9qldEvAs+7Bhrf3NxZ35z+FZscIk+pX6+jVzzYxXf6b8wtsdKjE89Hp2RwZUm9g2hUTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=at2oxG6K71VZI5x02WYMCXtB3BUn5yM+0yTtAT1IY4M=;
 b=VEH2QtUdmQY/Nodoc+lxzag6u7XI+vJEoWMxReN7QpfvHPLTNQsFHh99gGJt54Y+oRWpqjzTz4EqD362/EBWHA9lc+wJlMZIaYyXwtleQlPUdgzC8fMtAzovTDpXTrTDk7x6isgpK8miTK+1foKFN8HpIY65hjbJ1MPTofwUNE0=
Received: from LV8PR10MB7943.namprd10.prod.outlook.com (2603:10b6:408:1f9::22)
 by IA1PR10MB7199.namprd10.prod.outlook.com (2603:10b6:208:3f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 19:41:53 +0000
Received: from LV8PR10MB7943.namprd10.prod.outlook.com
 ([fe80::a8ec:6b6b:e1a:782d]) by LV8PR10MB7943.namprd10.prod.outlook.com
 ([fe80::a8ec:6b6b:e1a:782d%7]) with mapi id 15.20.7918.020; Tue, 3 Sep 2024
 19:41:53 +0000
Date: Tue, 3 Sep 2024 15:41:49 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
Message-ID: <is6ewj3bhtqy3zadj6lbdv6maupx4kmduvhny66ntifkji6hoj@xmhcf5jt4o66>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Brown <broonie@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0206.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::16) To LV8PR10MB7943.namprd10.prod.outlook.com
 (2603:10b6:408:1f9::22)
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
X-MS-TrafficTypeDiagnostic: LV8PR10MB7943:EE_|IA1PR10MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 935bd1c4-2028-4f11-1e31-08dccc507612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jjzsoljE58CWGzugFugS9qIAZkC6CER8lsTSeRjPFSlIuyb4ARzGEuTuaXKy?=
 =?us-ascii?Q?vX9EkpZtXCoNqeeLpqf2L6SDr5X8hqmFEJMh8KTUp3EYQGptnHb/mZ9B5VYD?=
 =?us-ascii?Q?0Pmp3jqxyccKzNP/b6HkKbXY5NC1uWaeTAAs6paMvniDxJl23Vz+nevDPh+v?=
 =?us-ascii?Q?uXWomhs8M03eOD9Xl49jePCR3jFBSJvEgJLRRKgQpT2440bzGccJQ0D4X5lY?=
 =?us-ascii?Q?XX4DX8A98Q0c5PvDPBckvurYyRpYLp87ciXjwtrckH4/DUgC/n1047GP+Asx?=
 =?us-ascii?Q?TCBNWXFtPYjPV41lJ2NdnXlOsMlp2SrUEHn5bLcJtkd4yvILaPn8Src9MYmR?=
 =?us-ascii?Q?exrcbK7j5SY9ATcV5uywQu0RQw7Ih3xghKBsWF0jP2KEDDDOwXvXFgb/QTyq?=
 =?us-ascii?Q?Uq+Rl9FGh7vL/zjWlsOmrh8CpRRVHm81ZLOpAzePT/QLdg+nFa8eEzpD9F/w?=
 =?us-ascii?Q?nqpZiWwJ2Q9Px03LnY4B4bfqqVWuZYT3RQfYlh4j0FOezt6jLJf0Gv1BtfC4?=
 =?us-ascii?Q?RnIR+juiD29c3sfZ2urF/yoPxT7DrbHkIFfdhuFG+4tLQOwH5AVs7pXFIS35?=
 =?us-ascii?Q?eBIDJ+yRiUszcwIuEqgHyekR0311mcOQu79lbmzOQ7g2EygYVbpjK63a0E3E?=
 =?us-ascii?Q?qsjei61Li7sgCRtqsQ6xpzsSGftj7Vz7MCNlz+A4YcPm0ZWNF4IaQiTs1ipm?=
 =?us-ascii?Q?ru4/tRiEk+M2JiUf6SSPwRtuHs0fwVr0FrTGMgwUa1pzJ/tndT5tfOhHZEYR?=
 =?us-ascii?Q?KxRn3tDqZcWZJkEpGxf3uhH4jslmYyOjZr2tTaoh1xUQ0/iXEyvwXS+VGl+w?=
 =?us-ascii?Q?a5UnABYfpgz2MWa3B6X1ffNhdQmqOkbDWJFiC1DYU+LkZiyAALOkDDbXn/th?=
 =?us-ascii?Q?mG8P3J+xDJAbT6XD97MpXQlil+KVfwDW28zcfuPBoDu94WK0IzehkBjeASfI?=
 =?us-ascii?Q?QkekZZlUxay2LDYAke7nlS+pjU1ZGG5qSazFFfMY0kbPyuR/B6a9fT9HbT56?=
 =?us-ascii?Q?10XNoWMTB6YewAzLYNGhXjpiavAvu5PT9pmhfIc8tzSFY7V0sgRbRhueMkQf?=
 =?us-ascii?Q?JbMWdx7ZSTe2zylZLrjpl/UKWzEODcI+pZfZNceJ4ooR9PQDQ9Opgoq2M/tS?=
 =?us-ascii?Q?A1N+RWEI/csF9cO89DYJ9b/2BOThhOOz7sJDJbKzQVhIxVaQzZIfE+8wL8JF?=
 =?us-ascii?Q?2exckWAfVeJf/OCAQpS5OZqum+JP81qBaT4NGY+bsgURVGI7DVUBc9OWLRK9?=
 =?us-ascii?Q?4f8np9eqkJHpKBobsskmGNjCp8Yw2vnEv9ZRm8CokJQjBOrPySku02rm/fT2?=
 =?us-ascii?Q?hQA7peTsEYLAyNfe3J+MYHdDwIOnWqbgxViPjdUkzqsM8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR10MB7943.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1+5kAocxFMEUICW34cuowiHyEV0x3IMlWySXb/XESzZ2B9uZ3kESDpQ106gy?=
 =?us-ascii?Q?BWdWgqFpe1HSV52+lNNnDfdbxbj0M5qHTbMh+qWJ0e0W0gFLyMqYvYi3Jh+V?=
 =?us-ascii?Q?+fNQsKEfhf/Q0Baxb6liMiF9zLHA/RtVNCrkYE6qPj+1CL/Q8L4xSWe+ul0g?=
 =?us-ascii?Q?Z86VQyp4Uw4Rz70H/kyg8Sqh65esidN/titYsaSFtQQ9pleCtmsfT6KJsKlA?=
 =?us-ascii?Q?cC2P8bIA1kow/gqIecyzCxVsRJQpWr+egtvUdWPwdM0hRnK2ZqYgq9CWGlX/?=
 =?us-ascii?Q?19mmkPwAnlIoV1krjUoho81LT62QLDf68nFgrnU7cgInxxTmUgujhRNFh6z7?=
 =?us-ascii?Q?9CTyv6ntI+A15OT/p1QFKIRNVouV3htf6tt2ltgJP/IG6B126vqXEPzJyF9e?=
 =?us-ascii?Q?T+8ky3q0Xp9lvOEFlr+yiHd/ybmYJ/O3eJEYhufDRXT35EN0UdeyIySarUkj?=
 =?us-ascii?Q?LR+lzo4sDUvdIn+5spapOEcvC8YXhFRC10EPrw4gBBhAmnJ6pnT8Y28shTzE?=
 =?us-ascii?Q?RAfKFcJlNx2HtAXCLTxA8hSRIObO7FuPLiK5UnsWLjY/pnbwvqWwQFz3HDMG?=
 =?us-ascii?Q?Nwk93yJ6zmdLBPyAXDnIVFJweShZ7zWwOmBEAeoG3/A5lepgQcxETsEju5tg?=
 =?us-ascii?Q?AVJFRr2loCvY5AiYNKkDFLx8z24KqiLaHB2dpI+7HUixzykQz49C9tvRzK84?=
 =?us-ascii?Q?2JzR3TzwJNZhHV4/Td/woItj8i2hrtvfpbyMTmsqDSfwIyKJdGyrfsk4nWtr?=
 =?us-ascii?Q?BgZDAOZheoppDOl6nlM7WGrt0j7o9OqNfZ+Si26fIrLNPbhVBDR79kH+i++L?=
 =?us-ascii?Q?iAPAPYwkhwhLpNdHmz9BYL8yF2dwwmuxxfAzdm8CqQLiDuUlaadJ84MTu0K/?=
 =?us-ascii?Q?0eIOAUbBp3BZ5a7R+gRKQaN66ZCZzw/FHC2FueGBHMktfzu3f1br97oXw1Dg?=
 =?us-ascii?Q?BKVa+UatyZPALguIVj/UZ5luJsnX5pZEursQrX3xZnvopKZsBaDZTapW1m3x?=
 =?us-ascii?Q?a5jbdIB2ADYE8bnzSupOleREiS1C9LEmGtIg6nRFeA4o9/aJMoAIoc+cC5fr?=
 =?us-ascii?Q?nnSnXE3Cm9Ya4CGq+B+nAD5UyZlWYcGQxG3XbAqAjy9qR0tiN2zQEltrC/9c?=
 =?us-ascii?Q?VSL2a83sfsC9Kp9t9yVYQ0DhDP1c+jV8Vb8EzjskJ67zHU0EcGi21JCIjCmD?=
 =?us-ascii?Q?yhTcbWpKPQO1/XPmEYzuuAzXnVPtuPzR07nzxL5WoWhk3LRO0s0OlvkrNq2v?=
 =?us-ascii?Q?0EcVB3dl3bvd4x+BRkYKQGQdmof76jF6/ZqvZIxdtGEg4Xr9HzDTHrayRok6?=
 =?us-ascii?Q?bTH10BJz1hJv2SR3AblvFr9j/C8aSrWg+QxP+x203On62jH+hHQn02oHPKCd?=
 =?us-ascii?Q?a1IFObISwAyfBTq+H9ZNlQVgTzQK4QB78360dq8J3PTz6IFtl8ZTB7LvxQu6?=
 =?us-ascii?Q?sbbDSGD78VwEqCcuF7sw0UxwCaWeuJOpS/JKwG3GNNly7GpiMbi2rs9X+Nzr?=
 =?us-ascii?Q?xpx+JKGLzjjI8fqmLIUvGYcwCsJVEnGRsIoWLYaquDt3YwU1Hae9aO4zAkqn?=
 =?us-ascii?Q?EmbT9ZsruNOHk8pd0nOqIxlXyOpgVuJe4Q1CWAZA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+Y9Q2v2a66ImpMzJtQoMUr6EY3SLQGzZGS6KTjrtAIYi0QDxaPg0Cd7IfSXgc1v3wWpxDpGd7yn24oL3mqlQqOGZy/UhSZMylZhZbcy9pxy/e8U76cFcmYP86q1hVkLgZ9WHtdyphpXe7oWLKv4WO5wyOTXZHddgmSeR8cWyfmuoxj7JqfECKBVx8Y/nADvpqTlAHw0YatTWgXt9StKqXjLzUUcZrZP9+1NSDSYhfLyxp8olAd2VKVSTCpW60w6jGgD0V81W9F1mJ/NwHgr0yWUhVw8VySN4IVf1p7kqnfKwNi2wIqc2XeZa9xGEzov0gU1Dc1SMKKXV5qEae0NyXXm3ZgXsaR9iPz84K1ZYrIlCZUCYZsa0/5liMNG7EGcYRJiE9/ST6HqzRAljfEgFizwDcoF4w5rNTPis3pqg1Gvpcokkr/vKV4zC4/v8zztWlU/HYjjRXeNfilaWBoaW9cp4ZcXoYd/jMWTN3jHZgBShv//0y87kcHVdmUCZwijP6vIXmnifZxdXr1GCWGSR4mgfNQJuCSVsUXMMV0Bj228Fy38fOACUlr5XNk32mmldj+zcd2kVi9XNAV7ySex8T5IkelZnuscXUcvR0lnJ+5s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935bd1c4-2028-4f11-1e31-08dccc507612
X-MS-Exchange-CrossTenant-AuthSource: LV8PR10MB7943.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 19:41:53.1599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPDOiWEd8fFOlvRgg3+p8lXISxjXA89aJVaK5xhkJfYVKwC4B1gOoHmhbtT0VvIaksiVraWJX7VxZCuN8EE8nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7199
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_07,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=941 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2409030158
X-Proofpoint-GUID: 1nvtVUZjxokQzFhxryhpNZa7AM_w-qtD
X-Proofpoint-ORIG-GUID: 1nvtVUZjxokQzFhxryhpNZa7AM_w-qtD

* Mark Brown <broonie@kernel.org> [240902 15:09]:
> As covered in the commit log for c44357c2e76b ("x86/mm: care about shadow
> stack guard gap during placement") our current mmap() implementation does
> not take care to ensure that a new mapping isn't placed with existing
> mappings inside it's own guard gaps. This is particularly important for
> shadow stacks since if two shadow stacks end up getting placed adjacent to
> each other then they can overflow into each other which weakens the
> protection offered by the feature.
> 
> On x86 there is a custom arch_get_unmapped_area() which was updated by the
> above commit to cover this case by specifying a start_gap for allocations
> with VM_SHADOW_STACK. Both arm64 and RISC-V have equivalent features and
> use the generic implementation of arch_get_unmapped_area() so let's make
> the equivalent change there so they also don't get shadow stack pages
> placed without guard pages.
> 
> Architectures which do not have this feature will define VM_SHADOW_STACK
> to VM_NONE and hence be unaffected.
> 
> Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  mm/mmap.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index b06ba847c96e..902c482b6084 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1753,6 +1753,14 @@ static unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
>  	return gap;
>  }
>  
> +static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
> +{
> +	if (vm_flags & VM_SHADOW_STACK)
> +		return PAGE_SIZE;

Is PAGE_SIZE is enough?

> +
> +	return 0;
> +}
> +
>  /*
>   * Search for an unmapped address range.
>   *
> @@ -1814,6 +1822,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
>  	info.length = len;
>  	info.low_limit = mm->mmap_base;
>  	info.high_limit = mmap_end;
> +	info.start_gap = stack_guard_placement(vm_flags);
>  	return vm_unmapped_area(&info);
>  }
>  
> @@ -1863,6 +1872,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  	info.length = len;
>  	info.low_limit = PAGE_SIZE;
>  	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
> +	info.start_gap = stack_guard_placement(vm_flags);
>  	addr = vm_unmapped_area(&info);
>  
>  	/*
> 
> -- 
> 2.39.2
> 

