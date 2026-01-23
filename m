Return-Path: <linuxppc-dev+bounces-16201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJwkMUsUc2l3sAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:25:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC24270EF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:25:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7Fj07j3z3bfV;
	Fri, 23 Jan 2026 17:24:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c007::2" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769149496;
	cv=pass; b=VN3z/foLusaIZ6dnHEKjyzNodLONMfNDhNMUWgAsqomtAoPMFyT4gk0FO6fuAERuP1Zr1s2C5axi8iuKd9qwBVMmj3VkRWlOWUQm4XueNZJmpzfRltpILld8oGOJae/HJUD3u8qF7IMVXsBZ1cFuKichSWMJ+mHp+emofJv9MFruWEVKH5aODKqqt1krV/Ei9XTuJgzTaIOEIHN4Ge2vCltMfBjEHBfrwMzTuSe23jhgiPr+3zZ3MQH21Wkyenu3s982JTSGhXBQMfBeLpK9sQ6iP2vVaVBdTe9Du9Kw9C1XkoPxz5d9jy/IX4Upp22TCK5Oqf0yuh1fc04lgW7BCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769149496; c=relaxed/relaxed;
	bh=cjEfkjDT5lAYEix+jL7EaCQjlu60kwgYU6Gs+ldKJpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FMNv+7G2o6Yn/3i3iHcSsgnU9rCTRE3Y5uxfYJT/JXVekpNrYBI6NT7O2tgZaiOA3GR+brrWidBf3rNCCYPVTivFH0nnz/rikRmBvLoNGc0zpxl7wbYNhzEqg6KZxwkKxbL/MWbN2lh+fXRWcuzoOggNEIaAtU5dyvNPN3BSe2sS/hDrnQ/LBvs14tQRcliM6rxqQHfXmZ7Mxq9i/EGkE0avQ7Wz11iixk9EIhycMo2nUrC1tDZYlm2d8PcJ9d9SsGr/liA5/dWlXoK1m/PonZUYaUrxIOo91hqpiU/H3aBimlopWz9x0AOOY56yrPtWMeP1RllOWbXkasyVc7UlbA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ieKu6Adc; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ieKu6Adc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c007::2; helo=mw6pr02cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azlp170120002.outbound.protection.outlook.com [IPv6:2a01:111:f403:c007::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7Fh2YQ5z3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:24:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjeoXlr2NBKi0m+R3ZdFyeBHx9Y0Zq/t8x1QS44kk30bpNSEOkeZztQTDLIc2rJVBfHrJrdp7r1zZJDVnzGnhc2v1Bg401ymU7zzmE64fLYvinllcrqMfg5fLgWyvDOnQKQoY0eyHIMw/KT0Llxqpt4DuYymcMmcWKBtQRRfUCu1VDTkrnOIQHSmOGBdidpWra/rpyYTBL6NquI9mh9HLn2WYVDb88Sf7uRelZG/Ib8uM/pWAW2nodjsHmPi21a+Ht1bhFst5w2H6ooG9Qg5plCDqLOPjhg+651TgVB6y60HcFsRWdeEGkVLeBHTClmmMVrNzkngdFmSAaDUXPb1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjEfkjDT5lAYEix+jL7EaCQjlu60kwgYU6Gs+ldKJpQ=;
 b=RAJa9n0UyGbZWQFP+6hIZi3YBz/obt7yrfsMzEe0R5LHdjBX8Li2rwfrOkgxBCf6DR9t72rnOT4wVXWpFLY6hMJqbW71s9Hw/A0WPJFmsxTkH5Cy/ORyHpC7Rw2DxhhKmlIJx/Na1m8GfXulWVMCPlMBjr8UJ8hO8pANMkqELCQPWi9eEgYK072+iJ6Gm7I4s5zBCaAyh3NnmC90RrZCl/iC1+/VPxc/YXQRHkshQ177BCsoG08Waywk5sDsb3C10MdMqS6BVh1PjF0+pgxa1keFFILSSMlOzGCbtopigyshG5RJ03+U1pEl/iNOsYlpFYIus/uDA3adjX+K/Crpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjEfkjDT5lAYEix+jL7EaCQjlu60kwgYU6Gs+ldKJpQ=;
 b=ieKu6AdclEOWsPltTBtZVktn4/asI7tw1EQO22ZG8QDX0xlsb8IMHsE0hMdqxuW7CF7WhQFt+C5YeMNxy/BhOkR2Q6ctFqiHSYU5lzWUFU8AorVMbo6xjY+7B57zJ4CEob3CVl1h1koCTBCUp8CwEStU+zq7NsQEwJBCRnaKD58w3jXhad7qSJBudwvemS3kDp6yPNrKkdQfq0kgRo5Ygyx4sVzYSp2DpMM8XaeG0NsQ0tB2CyXI1FWH6PbSplSgM5eqB3hgPDSNaqrrOOmZECLWyDLPVajs0AGOaAOwcCnv4VMsVw1qoYLJUtoTxFhH1FqD5NSbOhI4xYakK4MOEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 06:24:32 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:24:32 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	david@redhat.com,
	ziy@nvidia.com,
	apopple@nvidia.com,
	lorenzo.stoakes@oracle.com,
	lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	rcampbell@nvidia.com,
	mpenttil@redhat.com,
	jgg@nvidia.com,
	willy@infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	intel-xe@lists.freedesktop.org,
	jgg@ziepe.ca,
	Felix.Kuehling@amd.com,
	jniethe@nvidia.com,
	jhubbard@nvidia.com
Subject: [PATCH v3 11/13] mm/util: Add flag to track device private pages in page snapshots
Date: Fri, 23 Jan 2026 17:23:07 +1100
Message-Id: <20260123062309.23090-12-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123062309.23090-1-jniethe@nvidia.com>
References: <20260123062309.23090-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a03:505::16) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: 94162de9-409b-4f38-8ac3-08de5a48120b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D6fnLVcgWVjE5JFH7T0EwAPsXWiSJcAFJ//7pvodwAfgQtxZCqnwl8KyM8BQ?=
 =?us-ascii?Q?O1YvrhLcX2RiUcFTwat5klDPa+DGZKZQkH48P5buflS8cfWcd61NKMzlYFK3?=
 =?us-ascii?Q?OOpC9pPj4Sk2WALNicm2+lRSi5gHiczAdIKLsJ7MLpxhqopCHGtm3B2dHQrW?=
 =?us-ascii?Q?a4QDpYd4pJKnpX3papLsxi5OOVnmDU3WCPnBDBLM0PA4MZiNby+kch+biDq/?=
 =?us-ascii?Q?znoIZZSHwFFW/CvBgdjeujVmddKWCwvYjU8FVCrZkqAFXqVzc1aAZywBiXG+?=
 =?us-ascii?Q?wTrJxYhFmgI/kenUJMQ+49Mbq/HE22xuWF1pqh6JsXDR1qmVwjW7QflcDvGq?=
 =?us-ascii?Q?2USAXVusXKpIYuEXrDldEFDIwwFXwB3wqy1qdYzLqDuwgFZTyT1Uz03+vVGb?=
 =?us-ascii?Q?MpXopl0kb8GQyLN7wp4yt85f8mNbxXLVe2A6V2rluhk4aXFTJt2HFi8dDwLw?=
 =?us-ascii?Q?5VILEylM29uZ20JE5V0NQoajL7V3CX8hfhFWEiHYb/e2rc8afBj8V2FMbSLy?=
 =?us-ascii?Q?r1Mq2GzKlZONPESe1Pivveb6JBtd8jEhwmmZ1eq44iaP329PSOVa4niZmXaX?=
 =?us-ascii?Q?0yz4WRdnhWC0meW15FyWQsSezadUrbElSDeq9Xiq2U+lP0wMXDrVnEY/+F7J?=
 =?us-ascii?Q?eALuglsIDWTGi7EZen6MeoJjrVCDlVF5trnoZdtRLP0RbkjKAwRicQ2BJVaJ?=
 =?us-ascii?Q?sIihp3yB3CjzKLgeyTYkcrGfeIOIceCpMV+vxhE6KXKwTUuL6ueHrqkFfZMX?=
 =?us-ascii?Q?O43URR+xzn2y+C4p+P3T8C/VJd9fU2jxUB+g6hyeiEf2HJQxK6BB/nBpQs94?=
 =?us-ascii?Q?ee/4cLmqWdqttix0Pw8KpiNvsS0W9F+gJmEElvmCkYtbAgm6FmSHkVz5jtVF?=
 =?us-ascii?Q?RIri5p2zcmcV9C5PqksRiY26jLvdmRcXIDPxfggQQOBlDUlSl1DJZijjDj+I?=
 =?us-ascii?Q?mw5zpTWvfOWB+gdM7LQbSzfdmrBH/CnmXngPTjLyMfvnUdHTlBF4c7B3WBVX?=
 =?us-ascii?Q?afk0Egzkc8ibIMOLhGv6CPcFMVlrMy4DmUVMM1VMpPL4FwPwoUnj2tlImfiD?=
 =?us-ascii?Q?7I6ltR9LtUABEW8ki8wUZ7Wr6flxMex7NKZRO3+1w82n7TqyitiR/Dk8C1pr?=
 =?us-ascii?Q?U5x60DUCFBb4PDklHlVJ27nuLPYbnA7WEOwwfEMloTaPqvIwT7AeAEM8DaJ/?=
 =?us-ascii?Q?JHy0PZ7n0L9Wb+OQYioSSHTRDRKzaal7dTQ1Q80OoeJSEhNx5keiLahKLKrs?=
 =?us-ascii?Q?FOkmMTO/a+4VO1X0h7WVnHoVN1bOfMMeZaSPctioq6fkg6ygmrHySTGQTNQ5?=
 =?us-ascii?Q?JPRklmWZ991tiniOQ21WI8tYRdEgm/CgLE/bUgguXzLAeHhPaMoXRa1Bj64U?=
 =?us-ascii?Q?TF3aFi2QD3r9/EwLCZj5nGjyH7stlZINgwnjlQ1C8fcV7iJlnWLDo0j9MEZl?=
 =?us-ascii?Q?TLfT6rLhqP3pJs0HBSuAASiHC8yH75Vk23MnQYaf2Eb/mPyTB5RNyrTF/f3U?=
 =?us-ascii?Q?WBuAPvauAJvK5zA+dpDNm+dOrt5gxe11GYOn2pS5Tus38lo6MLnESk4Q9Nfr?=
 =?us-ascii?Q?OHKOQtkznpAc/6pSbqY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qKLHYnii+e4TjT3e3XHRQdLEUkSPOYnpthYpI0ndy28OdrBVwf4QH1nc6bja?=
 =?us-ascii?Q?8HHjNe3ihlmf268KGkQ+0QEnjm9vu4F2AMu03pbIbJv6qKqAyMs+X029HxzF?=
 =?us-ascii?Q?GNxlQb/F0SZtFDtZ1zrGtj9XonBxMeqa6d9y65P06Zs8APckQz2pJFtey26p?=
 =?us-ascii?Q?H8J3JlOQKB1dl5rpSJb4Vul93FLs8CklP3muyorLQyVQsAWuRGeN5N+p/lNP?=
 =?us-ascii?Q?KlgXmNP1fg8xEtyO4LAMtemrnkNtUQrI+AK7/xO358uCA0Jn5IPZlO30dIeL?=
 =?us-ascii?Q?CveEvv8c0pgl/6FF0BTky5pNaeUXAsbgdw1Mn1lvGgWQJJA1pmNs5wHqU3ub?=
 =?us-ascii?Q?F+pOiBv4OQy6fHiLyltG3id3kwUNCN3z3obgI+axWm1oapLbJNgEaXYLd6sc?=
 =?us-ascii?Q?FOe1VRP6rcMl4BUIzawwdbCiHqfamUse46rpIfhkfECHWR4Zu1MLFJHvu65s?=
 =?us-ascii?Q?SXy5WaMw0ZUYRtgRNquPGRDULlMR+sAEJQejQZQDg0xg5gTrcKd+UJejRAO7?=
 =?us-ascii?Q?7PfF6tQxHZ93gaxihDdNlWklx3U66uyQrk/GrHe/EsFcSww2guG+yALfeNw2?=
 =?us-ascii?Q?sQFb/MGxALcLUK52pfTHQbFEITN0abKKAGSB465GQfov4LrLg70S7jJksp/V?=
 =?us-ascii?Q?bGt8p4GABRIs/XwTmDoF+sCaxTjMLQ1Dto7nxMoKdyzrM+6O0N7HF4Fqh2ar?=
 =?us-ascii?Q?i//l+7ryDGosd/durKgR+vJJg+D96jPnKqRFenaxxgc+p7E4jb8u8Ixsha9f?=
 =?us-ascii?Q?Sx5uuR11+7Y5J0hcZHR7l6Kd1EUcd3D6rqi1YBFG5AinCcjox9VTRdh2ekxG?=
 =?us-ascii?Q?/JlsPGQ7luPcX+I7c/514NhViap3LaWmENTV6xNxPjSuS8cFDI+sd4kIWKJi?=
 =?us-ascii?Q?qYuSELl5G4lLysk6NcIZQSGGQSS336c7KQZ3cCr2FKQJ0RIJlcWiUQRXwhEE?=
 =?us-ascii?Q?Tlx7KbOlIxKil+STCmUJsCz9E0tKp0Mu5ngTEoDN6f69pKMkMcW4Tb25dI1b?=
 =?us-ascii?Q?BWiRqy0pLcNMJnAjTjczJSIZDKzMi0b1nMx7jeieim1EnOulXT3pxEd/tVA2?=
 =?us-ascii?Q?nSW/4oL4jGj9jgId3msDJC3c6pr8Ph4vsxKgR8ZjL2jcRrhzKZ/4mW1E/mEK?=
 =?us-ascii?Q?swj5Jbn7owj018Vweb/YxknNuK3On0oy3USL7uKb7E/MzTz/KU2taUgsOPE1?=
 =?us-ascii?Q?TcfmWxFnMcmUYW2TrF+u3Ee31DFib30S87MwAAb66nBYHRdMwOz2kqGAhnxo?=
 =?us-ascii?Q?COjQUd43K+YHKp4789PU8VbhXL1ojNLDos7xq6R+LZV4SpSbpUfbsr4tb/fd?=
 =?us-ascii?Q?BVUP+jyB2uytJStCsl4RsApy3crk5Fcy4MY/ufK/08eL/MIsC3O8j1jDXJYj?=
 =?us-ascii?Q?TzPt41amnX4ebn/L6HsyO47fGMgwCnDE7Rd8CgY3QNmjm8TmUnHxzjAcuO8O?=
 =?us-ascii?Q?5s1ccHEG6dtlUAmbWQLyoLxnSSADZ0Q3S1u6McCT3OX+odZuf5rdKfPHROkR?=
 =?us-ascii?Q?aIlZMSiW6RBuZQqWWVJfAY1Wj60UkQPXvaKCl4gahlYC/koBMAuOhPT7miBi?=
 =?us-ascii?Q?KgqfFue6YxyuG140uwoCci6GgkUpLLlHjsV+pJauaaJ5gYddH3titR+0KV0b?=
 =?us-ascii?Q?ojJBjvpVGuQYkSeX7efOO0sPLUyCo3i1uk00ZQluYX+o1truRc4jn9b687pK?=
 =?us-ascii?Q?35b8DY8lu5bCZfVlUc92fAPfduHFf70GOXwPUTSLMepkYMhlBB9qL0QE0gVE?=
 =?us-ascii?Q?lPIrb8I5IQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94162de9-409b-4f38-8ac3-08de5a48120b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:24:32.4240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0A4hRW4veRuHSel+bWjG0qJn2jT7HEx0yZ+vlzwqltqHoguIHrqnpXO+hVWe11zIq1/xspfXTCJUs03wQt0LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16201-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.035];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: BC24270EF3
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have
normal pfns and must be handled separately.

Add a new flag PAGE_SNAPSHOT_DEVICE_PRIVATE to track when the pfn of a
page snapshot is a device private page.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
v1:
  - No change
v2:
  - No change
v3:
  - No change
---
 fs/proc/page.c     | 6 ++++--
 include/linux/mm.h | 7 ++++---
 mm/util.c          | 3 +++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/proc/page.c b/fs/proc/page.c
index f9b2c2c906cd..adca0e681442 100644
--- a/fs/proc/page.c
+++ b/fs/proc/page.c
@@ -191,10 +191,12 @@ u64 stable_page_flags(const struct page *page)
 	         folio_test_large_rmappable(folio)) {
 		/* Note: we indicate any THPs here, not just PMD-sized ones */
 		u |= 1 << KPF_THP;
-	} else if (is_huge_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE) &&
+		   is_huge_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 		u |= 1 << KPF_THP;
-	} else if (is_zero_pfn(ps.pfn)) {
+	} else if (!(ps.flags & PAGE_SNAPSHOT_DEVICE_PRIVATE)
+		   && is_zero_pfn(ps.pfn)) {
 		u |= 1 << KPF_ZERO_PAGE;
 	}
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 6f959d8ca4b4..9fe63fc38155 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4623,9 +4623,10 @@ static inline bool page_pool_page_is_pp(const struct page *page)
 }
 #endif
 
-#define PAGE_SNAPSHOT_FAITHFUL (1 << 0)
-#define PAGE_SNAPSHOT_PG_BUDDY (1 << 1)
-#define PAGE_SNAPSHOT_PG_IDLE  (1 << 2)
+#define PAGE_SNAPSHOT_FAITHFUL		(1 << 0)
+#define PAGE_SNAPSHOT_PG_BUDDY		(1 << 1)
+#define PAGE_SNAPSHOT_PG_IDLE		(1 << 2)
+#define PAGE_SNAPSHOT_DEVICE_PRIVATE	(1 << 3)
 
 struct page_snapshot {
 	struct folio folio_snapshot;
diff --git a/mm/util.c b/mm/util.c
index 97cae40c0209..65e3f1a97d76 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1218,6 +1218,9 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
 
 	if (folio_test_idle(folio))
 		ps->flags |= PAGE_SNAPSHOT_PG_IDLE;
+
+	if (is_device_private_page(page))
+		ps->flags |= PAGE_SNAPSHOT_DEVICE_PRIVATE;
 }
 
 /**
-- 
2.34.1


