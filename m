Return-Path: <linuxppc-dev+bounces-16509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCZKB3WMgGkl+wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:37:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25127CBC3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:37:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4PjQ3mGJz3bTf;
	Mon, 02 Feb 2026 22:37:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770032234;
	cv=pass; b=HYrqFN2+q2lcL5TuA9k9juKUcqevemLXvxU/sBrdwjG1Y22uIfA4qtV1TWwGFhLSEnYqvG7BrQfkKgNne4Ox25M7m9Tn01AQlyk9d2sDWirlUCd0xk9muqKlqF0d2kBl1gbcNg0nF3AJBIAPhG/jH7B3OlKzlW2m1CB7LuYRRhp2EV4J2iVvbAiQl65/FzSCj/b+IHdOSopjPxRnPFJ5IeqUN3td21zyFVYymuWhJQ5JGNAP9Eepd3r+y3YgDYMn+WeHKV4fPj+KxCKm04qB/aBdNM28VMsjSCdTe8K8pWosTluc/T2Nzdbx9BbT1XYYb2aNqm+1cCtOTP6dghEopQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770032234; c=relaxed/relaxed;
	bh=FAkI9VxwxIbRZC/CL+/I9Nh8h6L8MkB/RJXfeqjrQbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hqdgeRi/t186uzrXtvv8ayT31KCiyjyFWrH8AmSaPwAAJqzhheo96P68/yiKwJnhkS5TvkYGPQhzgHt1kytBVbp6LlxH7Is8Ax9BJMlbxR8rzzYhdJVh1NCDj+SwCx6JAyVXb+w7rMPIHfip9sO4lE9oG1LsUloclOh4Yd3yW0m5drIT/Q5cdUwkOfJELQMh7PTDOJjBBTPYAkWmZcgJjCQLkJf19iIaGQyrFrT/WREWrjZIVqLJhe3O7OGdT6NqJJWyYOEQ9YaveTQOwM6kDfFjzLHBd1HZyQETsBgekQ4VSI87UxFZfwIXBd6FmSMviw/nInuNuVfPHOtLPyAjnQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qoCuvidE; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qoCuvidE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4PjP45wZz30FF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 22:37:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IM5pDUrrnhOVCWz9/cxEteEnnwf51s3UU4eqJ6FL0ZllBZ+1U3D9c84JIV0r6QsGmC8rzQVfkuko88fWIiO0rn8NovlgEgHUrf87xzYkfK1HS4Pp0vpfzeVkyxTgJDdHNgwkH19Sbq8Hg9ISFBnPppNwHPICOL/W9Usn3aZKvhFVEP92Xj1M/lWFMBRsaUIbCT6NHNTsEpq2g3alyCRlF2d8cevC+N9r30QZ6hz3MnYTqGM6bMK0uDZjok5whv9A1saSTdqKVJFiQhUnAP5DFgLh+2yl0t9XBC3nx0FtHDtECFukK3nIqSZ7jVhHEWjjzQa1gj2L9UG2SP2LLQQsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAkI9VxwxIbRZC/CL+/I9Nh8h6L8MkB/RJXfeqjrQbk=;
 b=BO2N5lAcSDhaedF+Pk2AwnUNq9Zank9ypKiI4jnVrMMSC3/UGXjFJG+UkrGXvW7U8hGExrWTtEI4mp/q60aP8ajPOEkJashCLzrSBxFfZm5nkFSc+0ThuRuDmNpNs4l1iBUoCKYBInSUwnfsVE90GBt26ND/1dlkWypedPMqkl5f82v51IMV9bANoo2B2/MAmrRTUOigw//2/rIZzqegYTHSX+Le1rhympN2Yvl/5uhFo9PszE2dkoJlfL6IRmalTWaNiJlXXCfW0XbFSdkULx9wan0s+1jZ6LHJfSmt5b49o4ZFn1MPiAlYxKBGJ/JaCfq5q4Lj6uX85ccLlwo9gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAkI9VxwxIbRZC/CL+/I9Nh8h6L8MkB/RJXfeqjrQbk=;
 b=qoCuvidEZaYixDBgP4Hnbc0461ePQ3i1Qfi9hRUzXnLq+q/d31F7zO1e680ap1w7obyhfC0kAnd/i/0ERwd3jXz/gOuBfFWSzD1sVBn1bL/2EtmSDBtq5OBpYTsjJki5qW+iS6orUJDvORKkEo4lBoNo6zQKtgtzJF4T04GJXo+I+AoqEsDiu/z0cxc8yoFG4/J06v02FMI0/Jk+g/52NbcVRuut+6uzxfi4qiunylK1IWMnmaMzbZ1QbP/8y2Gc+nyB2BETsXwIOORE2soGL+usBOHm63JVze6+JzYe15LonGPKmTeApPgbndNrH2DgJ8HGdSUJ+PGGs5i0CfVUqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:36:53 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:36:53 +0000
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
	jhubbard@nvidia.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	ying.huang@linux.alibaba.com
Subject: [PATCH v6 02/13] drm/amdkfd: Use migrate pfns internally
Date: Mon,  2 Feb 2026 22:36:31 +1100
Message-Id: <20260202113642.59295-3-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
References: <20260202113642.59295-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 006fc2c6-ed42-48d9-9a37-08de624f5cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qFcgcVNUs82kFXW9gQfz1/EYnL5540hEr9GvUGzPMKnzrrfDp1jTpN0jsmmx?=
 =?us-ascii?Q?xdb//WK2+OYNMZeAmPQHJtlBS7luvRgTfnhwmFniH+XkTtbY1i2v4NgbEFoL?=
 =?us-ascii?Q?qlLPrUa5PaTLHJaYhQhuFDvykJWaRKgoXbRXPQKwuphz/sEzUgey5ZyQZVUA?=
 =?us-ascii?Q?DNDOureTk6+4OV5xIPwlN63aAnDDsmE/MUqeh7XaKPbtBAv9BCdP4tD4fbtR?=
 =?us-ascii?Q?TR7Qkigp1CFo7e8rpTbh4I6WdffLyZ26CNCATJG5GHhltjCO+07mGz2o42AT?=
 =?us-ascii?Q?qyZad1rAE+56fZBOC/qbYM9yWM/wHn+GhC010hmX5MwsMHi/zAAekUGKfWP/?=
 =?us-ascii?Q?GGfKApY8dDEwCAUAQvxSrhJMIGEGtZvYC9hdLKpWWIz6dZ9IdkMfcAgdfpFU?=
 =?us-ascii?Q?y+eeDiAIZzFJQgBmw+EdgdwMR6qVS5rRutsXYXehpFhVKSDpw4Cks27c3ot/?=
 =?us-ascii?Q?UD6vMcd7npFZMSLB48oaKlS9AoX7SGUBybl4iKfgzzZx3lJh+e80J2ibMHky?=
 =?us-ascii?Q?INBh9zmmiGLrIDfIIKLPEBDoCAK+XhcTCAhWth7E7tLkhF+JdDRjjR8nLV+l?=
 =?us-ascii?Q?CK4YHSEpRnTSOemSz0mhO6JZL2xgmykLFn9qZfGwRD8JIwc2dR1b1XxAljRH?=
 =?us-ascii?Q?/QPureoK8QrYX14j8X6uHMe6eAU++GwG76gClcjopSNhvDFipcfV9koqhQOz?=
 =?us-ascii?Q?+6ksRG5yk7z5xOCS1DmwLx54+BB0IhGiFtI/16pCnwjYd1kkb7uOwTDo53u8?=
 =?us-ascii?Q?2tb3xVZPAms/d50ODGfDt0mMqtv1AfDLIOR1aW7GCc4Feqz90LbaxYy8h/XV?=
 =?us-ascii?Q?3pJyEIexVuZFZsHJkZ9zH/Lz0JqAfw0dmZryNJCqiEXM5Tx/BUqRTu9dVLc1?=
 =?us-ascii?Q?z/QU/9eOLw2JhnDhIUV1SU2QggLogIiwQvOCmGFsxeuKcn13Ix6a0Ptdy7Lr?=
 =?us-ascii?Q?tPq+0EvrNb+VlR3h7ExWq3T+bFAL/pUntda0wr73NE+xZ6m/r5KFpsM35XLs?=
 =?us-ascii?Q?4hqPhL6xxeeZpqQh40jwGmJXDFHN0CYyKl3nI7czy1mhnJA61HLWgS1xHqal?=
 =?us-ascii?Q?Xu4vqfof8MZg8x7tV8TiL3qe+JWwBU3RS7FEzy17OcM2aNZp62L3KoExHnrV?=
 =?us-ascii?Q?SDx39eKJgi/oooBUne9eHjFpeQEV8ZrYeFaTQqBz3KWoiG6f8PSWIphDvH4s?=
 =?us-ascii?Q?vcXS3eaE7j3p7wi+Upf8lNwmS8IB/mQJ0doXjxF4TC1mmx8/A7zUJiFNoCq7?=
 =?us-ascii?Q?/3JDSJEywPouT3kqIvqTNnIvaKwDL5JUjzJ7baqItGxy0Ro24T0hhMDgpujH?=
 =?us-ascii?Q?NIWg8JkxJa/CZ7ep/xoWyD7o5INVjvM1MTPjAkBwpx0P1muT0bQafBCsa/Sv?=
 =?us-ascii?Q?ieZu2euzf16c5GYhe85GB+L2QDZl5dzyh3cUHBWmpD2W96wvH5JIROBSc+Dd?=
 =?us-ascii?Q?lkL0jAfuQKPPjAJRQLWgo3gVczDD8WzQij7WTOrZEzKoqmiqt8VAPdyVQKEV?=
 =?us-ascii?Q?+Y4MqFOa9MzZycn2Pu2xVZixDN8Fdy1N2rdHePjMXvN4B+zYte5bursKb0I2?=
 =?us-ascii?Q?Wq9gnEVcU1CC3v1eURE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzM5IkgmW/VJR5AjY3JWuh74tx4PSo8nMz2T90dpVuHtt2msk4LVOrK/XltI?=
 =?us-ascii?Q?flVsCgqU0+YCd5nTI0/EPscvcqVvZA9DDjy+1U0zmyydD4JF2B5rDORatxMg?=
 =?us-ascii?Q?JiATOEkxmHcwQudo7IpFz032clwn2SWiSw1u/5O8fvApSNPWovwD91H3cuAy?=
 =?us-ascii?Q?PQKNX0GYVzoyElU6tHIHmiOYoK5RmE1xINNkliRLDZfOP4RRiR4W7ETFpFUD?=
 =?us-ascii?Q?JTs2UWceC/9wWKhMl1yMibhklWbSOIH7Oa3y10cyUWj2mJZ1gnRJUu6Inncl?=
 =?us-ascii?Q?qOlG2OsnVFQHDUqX/+4c8qrkqbi7ieZaL87Pmm05OdAXNKWvQoZv1q4WIjep?=
 =?us-ascii?Q?I0AAWJQ4Qaj98qxTOF5uYQX6OFZaT2au+VhmUNVq6ta73vqt0DdWyfIG0raC?=
 =?us-ascii?Q?2OJCEAuW7zRoksJ/zprKRxUG4RbRCWtsyk6ZY485BKWiqvPF/ue8690s3OnN?=
 =?us-ascii?Q?rIG2A1iaTWb3QN/L1CLBGWgQl7QQAlGVyqyhg0gV6kOYkNBMvL+eskN4ar4G?=
 =?us-ascii?Q?UimTcqNplnP/CEtrcznAUwuxyXa7MlY8SxSs3uZEaUxSaR1liLonXaphOqxA?=
 =?us-ascii?Q?z/iPSz832u1itgYnOGhEn5pFOFCCzgMSRwpY9rGj9gPQr0Cak7a3Lt8E9hp+?=
 =?us-ascii?Q?oY9zvmPXnTedOZYFQ9oBV7QsDAeS4Whx/f+z1I1h51kvFiTpEafFDj1TYM5l?=
 =?us-ascii?Q?J4+dO5Qt/kNtzwWK7wgj0tvlVaJNjX6xKfK2Orl9JRyz/hVCHMhKKQDV9w0r?=
 =?us-ascii?Q?OpvRgq1X7OI9kkuJ+xbYHdxB8cIa7YMZdrYR5hnf08m02rw+pV7URBcI1ZkD?=
 =?us-ascii?Q?z1aB3ABFm5xB36zrcN/nQfgQmA5DwqsI0/IYRQCX+2s3w7DWSTNUX7g09g86?=
 =?us-ascii?Q?U1+074c3tTqbqk9pJvIFb5jJpq46qEFtPPim/SCXy/6Y177cCBBgB3Zai9++?=
 =?us-ascii?Q?w6xYtP1393iNTalxBpJqSWF2vUz7F9l7+ScFP0nxRT15P+qobaQQ2TGx+9xz?=
 =?us-ascii?Q?y5hNt7DZkDbLpm3KBSlFEnN/TmhDiZILCFqstyj1r4CviSkN/H89SJPFdnX2?=
 =?us-ascii?Q?IqMde6r2YrGxoxqmEfjDfg5pjDArwbgnOMV2HSay1S2Pyz/mb30NgYwwkhnZ?=
 =?us-ascii?Q?jvKfsuIieFuTIoI2AUh87wnn7U89nPuvEZYMfLjolN271oJRNww52AB/Rr0K?=
 =?us-ascii?Q?JqO/69ZilZ4yIiqZtO/IZLkL2q5IMoIONqOqC0NA/1h9G0ut2ucPHl6nJvWy?=
 =?us-ascii?Q?XUCcrn077ygJUStbaJy/1xmnfBd1Fqqiq3qT0uzfJ0S5cs/Kfg4XkGiSleGA?=
 =?us-ascii?Q?q6NdFEaGeyGLncPaTQ2L1AiqLVfY5KsuAiTYXRmUc7kwS7rO/NGz+qJG+T/0?=
 =?us-ascii?Q?Ed+bfuaYXSIRjTyMCI3cweabIXDVORAtawAnRijEk5UIx6GLxy43JEqeW3KS?=
 =?us-ascii?Q?k5Gij2dFDs0wUPzS53yOWrHmGCea3aUMPQa4IjjFjhNwjlyd/WQY96AL6TuI?=
 =?us-ascii?Q?34pUOTcFrJWyhWcR7Ql8huCWsbsYnUPQTLPxAxT5qpI1DbUyVk418GaMwZbj?=
 =?us-ascii?Q?+/eFDbue0605J4tFXeXliJ3U3CwPMI/9tFUWkHcvcXmpNYB5nPDh0+K1QUB1?=
 =?us-ascii?Q?cwnC8+NPRnpDuxCeAjY7iH/b7Jrfk9cUoOpKroNyxbnivCYKOoWh9vpbWK2u?=
 =?us-ascii?Q?Dd+/xLo44ccumyPfntz1S7JUFB540NYSsFr9ptOIMXm7pwzpB4RpVnqB7w2x?=
 =?us-ascii?Q?igSaRDn/hg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006fc2c6-ed42-48d9-9a37-08de624f5cf8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:36:53.6289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PA2ulZqwQ8XRd10i/UNVaJCV7M6EM37rKl4RuEMFAK1z5gSbeSweyEK9iaGLb032X9a2IXAMf15kOlcjap7qsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
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
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16509-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:ying.huang@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,amd.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 25127CBC3D
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory.

Replace usages of pfns and page_to_pfn() with mpfns and
migrate_pfn_to_page() to prepare for handling this distinction. This
will assist in continuing to use the same code paths for both
MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT devices.

Acked-by: Balbir Singh <balbirs@nvidia.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2:
  - New to series
v3:
  - No change
v4:
  - No change
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 15 +++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 297fa108ccf9..b6075a2808c2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -210,17 +210,17 @@ svm_migrate_copy_done(struct amdgpu_device *adev, struct dma_fence *mfence)
 }
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr)
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr)
 {
-	return (addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT;
+	return migrate_pfn((addr + adev->kfd.pgmap.range.start) >> PAGE_SHIFT);
 }
 
 static void
-svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
+svm_migrate_get_vram_page(struct svm_range *prange, unsigned long mpfn)
 {
 	struct page *page;
 
-	page = pfn_to_page(pfn);
+	page = migrate_pfn_to_page(mpfn);
 	svm_range_bo_ref(prange->svm_bo);
 	page->zone_device_data = prange->svm_bo;
 	zone_device_page_init(page, page_pgmap(page), 0);
@@ -231,7 +231,7 @@ svm_migrate_put_vram_page(struct amdgpu_device *adev, unsigned long addr)
 {
 	struct page *page;
 
-	page = pfn_to_page(svm_migrate_addr_to_pfn(adev, addr));
+	page = migrate_pfn_to_page(svm_migrate_addr_to_mpfn(adev, addr));
 	unlock_page(page);
 	put_page(page);
 }
@@ -241,7 +241,7 @@ svm_migrate_addr(struct amdgpu_device *adev, struct page *page)
 {
 	unsigned long addr;
 
-	addr = page_to_pfn(page) << PAGE_SHIFT;
+	addr = (migrate_pfn_from_page(page) >> MIGRATE_PFN_SHIFT) << PAGE_SHIFT;
 	return (addr - adev->kfd.pgmap.range.start);
 }
 
@@ -307,9 +307,8 @@ svm_migrate_copy_to_vram(struct kfd_node *node, struct svm_range *prange,
 
 		if (migrate->src[i] & MIGRATE_PFN_MIGRATE) {
 			dst[i] = cursor.start + (j << PAGE_SHIFT);
-			migrate->dst[i] = svm_migrate_addr_to_pfn(adev, dst[i]);
+			migrate->dst[i] = svm_migrate_addr_to_mpfn(adev, dst[i]);
 			svm_migrate_get_vram_page(prange, migrate->dst[i]);
-			migrate->dst[i] = migrate_pfn(migrate->dst[i]);
 			mpages++;
 		}
 		spage = migrate_pfn_to_page(migrate->src[i]);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
index 2b7fd442d29c..a80b72abe1e0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
@@ -48,7 +48,7 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
 			    uint32_t trigger, struct page *fault_page);
 
 unsigned long
-svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
+svm_migrate_addr_to_mpfn(struct amdgpu_device *adev, unsigned long addr);
 
 #endif /* IS_ENABLED(CONFIG_HSA_AMD_SVM) */
 
-- 
2.34.1


