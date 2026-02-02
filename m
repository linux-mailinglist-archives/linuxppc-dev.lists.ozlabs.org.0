Return-Path: <linuxppc-dev+bounces-16510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJkPDHuMgGnO9wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:37:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F16CBC5D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:37:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4PjR4v9sz3bkL;
	Mon, 02 Feb 2026 22:37:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770032235;
	cv=pass; b=AUVRaXh824/94iY2NtMLl9LXxm8Q8BER5y1tCGGb9pZopaOrTsnMH4zS8tmEXUJllip+/dMeJUe02URGh5Wl1NBlKJpFTEkZ2N1zfIlGvcJzAiWIfKP96GO7e2UgqaId85itiMj8kyR20HwbXjaaU2gY7mQ0AgGD/YCnTZFHQpoiUtJ9bjl18pXnhTmSNUEAmmzitdl59zLP58XImO1tCbKL/LMOR3a8iEH/pH0A4U6gxYMp8g3Zb5nyQ3GN4OXilZ7u5hFrZBhjCWDSrFqqtB8rQwdT1d19IO5oTRZ9nMRqmQ9cHBgj6sHVCydR0mYbNGLif5qeO8l+t0ApwjHIVA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770032235; c=relaxed/relaxed;
	bh=Ci9E/QBswmvYABhs6hTJGuK7/Fv94fZkIaEPR9HHavY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cw6Z6+AxP6tRqm8fWvtSw4obxIm9ElzAeJe3YepvwTGUX5trS9PywxfyuNUnT/KL+ufFon/0fXhLxBIFIsBldRxwIYhl8eqY8aA9bzUtXYPeNiBrnfxMJD/Kh5Cu/oDAdXE2pQLDwTNWZG+QO3jp49obvA1HlydgM9jLj2Xp9uw9mVlI2np6+YdbmWxzibjTwP6wCcpYUd03O9JVHFaoMz1ezFtv64YU+9VPt90LaEkEv+F/ShKXGAXzMlcPlLrEIsynLc4J9G+cpohn78u1q5d+BjDyGZ/oBUmwRJnwIdSdpUm3JkWpxNhG7+9LKJcPE+a/YjAMSCUIaTRg2+fh8A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uertBhKX; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uertBhKX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4PjQ4X90z2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 22:37:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jD24bYT3LktP4pX4lPegGKdHVOVRFchxyc7RsJ7iZwZ5IK/0zsLrMhqdQuWGUVPct90SlX0ueUkzBw/+C8lNZZnmFyfmb3BGCC+XmEtUJBDsYtpTE5IXKbgCwPN9htUJxvIBs3iyX5ZV8jM6JZdx5z4xT2f1nV6Z44FJ8yxtGUrtPE1ezo7GZgz03SNmgErl467m1zjOzifjm1wDDDmspgbF/VYt1pfTycyXHMw2jvtODGQ95QcMChVO4ZIVW/oQdN/y19Dmg5nbedn0P/xLlrV0SFZ0CiBG0QjWOYveJ30e1Po6cqk7i32ah/8pjDajFuG7ivZ4tbglo5I7eDC6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ci9E/QBswmvYABhs6hTJGuK7/Fv94fZkIaEPR9HHavY=;
 b=MjyrzJv+8KJkPnlMFKydFO5Hu1+LfovpFOb695mOEQIKwvMJJz2N8pD8gXt5LsVkZitcK0r+zbEqipokAtB4eaaih+6J3gCZHks2UY8AqApa+SCk9KWrb5xXj/8Dct2Uk2ue4MNBJZrzwfmuVcnrRfkuIRv0fWakAQCDbmwjeQaJsGI6xiLY/4rhw4ZlDbi5EXvalFvT4eChW09lUFPgMa3sIkD9wujIYAl/pb31xle9GyPTbElSa00Rj8uS3eAZ8tSqgRaC6MXZQlSY9LkvC0h1tdApb9hFi3Qh7oV4g6vQvuR1Fi7pxYszviwci5TdNWslCMtkfK536dpULqnZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ci9E/QBswmvYABhs6hTJGuK7/Fv94fZkIaEPR9HHavY=;
 b=uertBhKXbgdeUFdjO1t76jqyTOFarLTciCw0hHEoIie8aeKi6nKxr650Dv7OTmU4pYhGIdeT26W48PZ4fLY1ZDARm2izF2eWnNiLmNJz0FhRALKNzowrEnWYcCaeTf+/c/Ru2eUjJd29ZPQ1eigVpr2yl85EEMRMLBAx89grKFCFs+1a0ZofeFSiH35ObZa14d5NLQ9t1YjIQtLv30jZsKmAvPWuf6HOePS+OD56ZESjOHV8NWmXQwcTnqQlxWm4BVJQA/ZEhXr8PJ7r06ONy+IDHlcSEaV1veUpv8XlkM9Uz0mfqHxLB120C313Lv9cN32eyDPtm/NilyX1Toc/lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:36:56 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:36:56 +0000
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
Subject: [PATCH v6 03/13] mm/migrate_device: Make migrate_device_{pfns,range}() take mpfns
Date: Mon,  2 Feb 2026 22:36:32 +1100
Message-Id: <20260202113642.59295-4-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
References: <20260202113642.59295-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0085.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::30) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 371b6624-afec-4d27-7ed6-08de624f5edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o0s3W3cseqnp7eTjsQ5zrrWBsMeNUlo9aTSXUM/K/2R/m2nhz08FuiP9hc1l?=
 =?us-ascii?Q?Yxkl1Ao/FAPKaB1WlzABSd5ZcQBvd6vq0gSrR+rbGBweNG6hxTbzzFXUkES8?=
 =?us-ascii?Q?IxKmH30JdSgqEZ67eUO9IHB1hKgbEiwbwkfUprhVXKWM18G3lcVfGNa/C2sq?=
 =?us-ascii?Q?54qi+KyNpXeK5EbxtMZJ2gQcS2MD3ZQ67w09PdP8Y0XLYy9DIjNzrvxj1hAS?=
 =?us-ascii?Q?iytAbugK1OsEviAFBEC82C7cHlDWlvUmhMPmDgGgQ9NdDBbYEtcI5xJucJtv?=
 =?us-ascii?Q?Ku65dwC6KHWdZItJydgXp+FLCt+lDPC0fg4P3SFnBR956Nj6nE1J1iaaATaG?=
 =?us-ascii?Q?ijQ6rQmDuv9UpCZhe6TJWjIBs2hxN75/hxJA6Vuiqsn9qeSZqCCZNPvF9qqD?=
 =?us-ascii?Q?0N+pKCg4xpNSMZKP6LVNOBxbcXZmcu4GohfLqUk6ray1xrPXRLWFPS9pnJQS?=
 =?us-ascii?Q?TDpWwTQkHhb8h9CnmrgJmx1ey284PJ0EayDDKRo14Mh3ym4fbkYF+a7p7Jm+?=
 =?us-ascii?Q?7gDB4LFGm3rui59ZIIRj0+FjDnIYxNnJ72GaUoVJEv6lDvtFfSgczZAGUVxr?=
 =?us-ascii?Q?jner1juOMzTOutkzae39bYSKBl4Sgyez6YZMyBYS+g4rHfOfVE4wsiRJ36uw?=
 =?us-ascii?Q?aevPUfGYA9hubzZcv0G2FmIdr6w1WnUW80fMUgyOHvy7z1OI+bEf7sGUXSwb?=
 =?us-ascii?Q?u27Wif6JkAj+7OHSVKHyfvIASfFcOm9vG7aIq2u3I/s2Vb1ZxVFWBg09BLCL?=
 =?us-ascii?Q?9jzmJ8zSgGulJxrQAhrMCsfrsUoBq22I69CsS/N2LZVn7LtSM0aCQ3/iZU2h?=
 =?us-ascii?Q?7fMyjoA7q+QI9czPIw3zTqBP0CvwFxrfMfAt77LihMf2eueA09PIoYXto0Fl?=
 =?us-ascii?Q?dxJo4WEG9WR4MSwfEiJHxjUvR33amw+6NgNrmqjIheQgc/FHpC5hMIzwH80E?=
 =?us-ascii?Q?g/HuoQxSTw0txG1N0IxFOhqIMNtrBH6uhZvrESzR+XmAo8t+90IoME9hvv5N?=
 =?us-ascii?Q?JYNywQYocxUVYFQnfXf5DxqwndwgNyAWGRI6GU2w5eO2j99BrDTpeINBguhW?=
 =?us-ascii?Q?GzZT9z2CXCzBa4/t9QxZWo7ndZvCKoTktcMD+etgt+Hxh64/MEvfJUENIuCC?=
 =?us-ascii?Q?fAvRR15Jl96eOAiM7gRKON1YultIuhNyMOQ/7a9Ig5PZT6foahOJBVb3Ogsq?=
 =?us-ascii?Q?gn40wXC4eD2EqOVQuvrJ/PyU9Iu+TTM0O3C/WiMNcnUM5bZYDWvKh2PxXwMq?=
 =?us-ascii?Q?PxD9D4EfsUmvuOIg4ISWTlsXI4vY1DzCMvo7ctH2bcqF8mEjrgII+++GdaQ5?=
 =?us-ascii?Q?AX1ex5mL5LCieXF8ztLZQwQzwxAm48UOSHZdnv/VWkDO5vxrw6cr3DY1YgI5?=
 =?us-ascii?Q?/w1Cafb66GYb6Ys0mR0iBYBJUb1lEFJJmRVwMVDywpnEODcGRUHMibi/5N0s?=
 =?us-ascii?Q?a12uBp8DRdpISrAhHo3EzQqw7v6btLxG8K3cdxnrDrJYYHzZ6boI1HdpNEc0?=
 =?us-ascii?Q?zz5wvfNfEEQNB+uXdH5LyR99wIdL3MR+Ouwp0v0MdpLVPSpn4tWAz0jZsHjM?=
 =?us-ascii?Q?GTC6w2XDJy8lbLNzy+A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DJ0FpLtMZQ5TRFe8bp7ESiqs19bRdWruwbCryMs5ugCXkS1I8Uwz0mX1xTdR?=
 =?us-ascii?Q?b24Z2axUTs7x0lTOF7VLfcew82QiC4VBPubJ6DB68/bO7rF2m1NpWQeIFWq0?=
 =?us-ascii?Q?iZ9z6JNXBkNbKJDchpy2IWmZ/kGuQdJ2eng9oQT7Z5IiUSn0PoD2ntg6G6Xu?=
 =?us-ascii?Q?ICSCs1bIAcMCzarQ8Zanv367JwcfOCfSf3AUG6JuWg/GjfKwRhXMdzUTZ8b5?=
 =?us-ascii?Q?SLmzZQHzQeUcMHUJLU+7vLQb4A3vMXjAlPNCFSGAUr1Ni2WuSBPGeZrAK+NH?=
 =?us-ascii?Q?MbS/iVIeQ0Dhse55W9C7H5HH6Y0uAIBrjw/X5fJqWdXprphSanCPgkQgVMdJ?=
 =?us-ascii?Q?ZUWR3rrCHRRCxoZIQDhV6AID9E5LEB7M5TCs2oL4VHPqGqSDdfIttWfukhbg?=
 =?us-ascii?Q?3pFoYvNu7jR5k352lfAL9PR+pn9Bz2RvN9m0H4iIIIoj2KOGY1i12yW/LtnF?=
 =?us-ascii?Q?5RWRjug99Enu5VDtNcgcIcbA1QSfP4g4IAmj6AX1J17A/5JZk1RloRT/x4Su?=
 =?us-ascii?Q?Z9T2vHaiTlZJpwSMgRS/ZrB8Zn1RyivcnSIu4mAvIoawSCaIW8fxKf9bFL8n?=
 =?us-ascii?Q?loo4XuccCXqo9uQ2YK7NURBfD3/HImJ52LN/R6EMxKqGKPHEylQewrkIp6F1?=
 =?us-ascii?Q?H2XJJC3yLiW3mXsrGiLnLaMDxbK85vJT7W2OWgj6dL4hw9Yxs6GT1sMRXDjg?=
 =?us-ascii?Q?N69AJ/v8Yy/jJm5+jOk3MLXd6mlMnX1N+UEbmCZPsnktsVZN7HFdLL/EIKSZ?=
 =?us-ascii?Q?16e9LTrDTv3gA+N3pYgSnUou4wcNKNGZMobmX7v6H8xBkqt0Q84vaMWXi27R?=
 =?us-ascii?Q?gVjgBrXUnFWu9COzDx2N+SXzEQ4PlMQH6ryd9Mv7R5umSOzT1U6hwUjuwv3J?=
 =?us-ascii?Q?efH4GBT1SH5bBr9UebeIP+F5R6YGs+kBd2fWEkabpoU9uBpP4ScHT5qNLeSV?=
 =?us-ascii?Q?2jgG+TanDfoNlZGDu1IWVAZfFz12G5ZS4ySlZPOd2xFFnUO5Rihi/UmwcDVw?=
 =?us-ascii?Q?8w8/W/f+ChCatusvEA8HdZq8UUycJ5NZfNX8Lpj1GMj8gZRWwjEf4bPyHB5L?=
 =?us-ascii?Q?FirWjX/EHOwRrpqKNkhSxBKEfmNe0Wym60Xwm08AmWUCU4WpawVLvOeneLgM?=
 =?us-ascii?Q?J9EGBmEZghkLjuZwY3EoXctqp7OM3zrG7QGknvGQLNHLNMBFNbdBOl3cSDgR?=
 =?us-ascii?Q?eftJIfRTGprWxyQd9ZfMtXTnhpfTfrV2rhShguUCAhqePDJs+5uqN5ta03gW?=
 =?us-ascii?Q?qLcnq+0/RwvX87ISCXBQHx6ZR0kqret8B1ohz5rjFP38dq4JzQ0L7TF7Iw6j?=
 =?us-ascii?Q?bzd/lMwaZPsA9oGM8DOuWW1MuOAA8K3e6WVMd3D56X+BxRF9HhtrNI/xUAmP?=
 =?us-ascii?Q?CYRZq2cenF4FBndyPzziFK8s2KQAI5yzNij903qOm0GNV/HucWsOGUiwn3rF?=
 =?us-ascii?Q?17alZS37mlOWYnbKkyzf3OCzuvqJelCU7LtNUmglOywLz06Gd7/S5kFsjhXl?=
 =?us-ascii?Q?RGsuz+Lmjtyhe4m/I6g+x3qG2XN8vcMiSz+gz0Ii2Dub9lWe4ITSCLXDbR/R?=
 =?us-ascii?Q?rdIPpw9s40PTtY8lbDlzOIP3DZrzNBgJ+eG9bicFEahgJ23vXcD0ya5+hMbv?=
 =?us-ascii?Q?RJ3npkDTcGlgIzei/ATME7itU1+vTZ96DcUgo0FnYi+KRbpnY9HlTOb8ECXV?=
 =?us-ascii?Q?oeFURr+M6vKKX0PGZM6cx7l9UQhqEAH8JGciDQR12JQRfGvvPZpqfqf+fD8e?=
 =?us-ascii?Q?VcZYqNkoaw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371b6624-afec-4d27-7ed6-08de624f5edf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:36:56.8168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZe/Q2NpH7t6H3qj2GBTSJHaRPcOk+NMXuopMeovEblrg0i10rYPgHG/cM1Yi/mTTyJSw4yuxV4NWE/OMrXy+g==
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
	TAGGED_FROM(0.00)[bounces-16510-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 69F16CBC5D
X-Rspamd-Action: no action

A future change will remove device private pages from the physical
address space. This will mean that device private pages no longer have a
pfn.

This causes an issue for migrate_device_{pfns,range}() which take pfn
parameters. Depending on if the device is MEMORY_DEVICE_PRIVATE or
MEMORY_DEVICE_COHERENT will effect how that parameter should be
interpreted.

A MIGRATE_PFN flag will be introduced that distinguishes between mpfns
that contain a pfn vs an offset into device private memory, we will take
advantage of that here.

Update migrate_device_{pfns,range}() to take a mpfn instead of pfn.

Update the users of migrate_device_{pfns,range}() to pass in an mpfn.

To support this change, update
dpagemap_devmem_ops::populate_devmem_pfn() to instead return mpfns and
rename accordingly.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v2: New to series
v3: No change
---
 drivers/gpu/drm/drm_pagemap.c          |  9 +++---
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  5 +--
 drivers/gpu/drm/xe/xe_svm.c            |  9 +++---
 include/drm/drm_pagemap.h              |  8 ++---
 lib/test_hmm.c                         |  2 +-
 mm/migrate_device.c                    | 45 ++++++++++++++------------
 6 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index f5e76c75e609..393c5419aba4 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -505,7 +505,7 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 
 	mmap_assert_locked(mm);
 
-	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
+	if (!ops->populate_devmem_mpfn || !ops->copy_to_devmem ||
 	    !ops->copy_to_ram)
 		return -EOPNOTSUPP;
 
@@ -590,14 +590,14 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 		goto err_aborted_migration;
 	}
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, migrate.dst);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, migrate.dst);
 	if (err)
 		goto err_aborted_migration;
 
 	own_pages = 0;
 
 	for (i = 0; i < npages; ++i) {
-		struct page *page = pfn_to_page(migrate.dst[i]);
+		struct page *page = migrate_pfn_to_page(migrate.dst[i]);
 		struct page *src_page = migrate_pfn_to_page(migrate.src[i]);
 		cur.start = i;
 
@@ -624,7 +624,6 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 			cur.device = dpagemap->drm->dev;
 			pages[i] = page;
 		}
-		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
 		drm_pagemap_get_devmem_page(page, zdd);
 
 		/* If we switched the migrating drm_pagemap, migrate previous pages now */
@@ -979,7 +978,7 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation)
 	pagemap_addr = buf + (2 * sizeof(*src) * npages);
 	pages = buf + (2 * sizeof(*src) + sizeof(*pagemap_addr)) * npages;
 
-	err = ops->populate_devmem_pfn(devmem_allocation, npages, src);
+	err = ops->populate_devmem_mpfn(devmem_allocation, npages, src);
 	if (err)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 3448e27bd42f..9806236e6d6d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -483,8 +483,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
-			npages);
+	migrate_device_range(src_pfns,
+			     migrate_pfn(chunk->pagemap.range.start >> PAGE_SHIFT),
+			     npages);
 
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 213f0334518a..fbf5fd284616 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -10,6 +10,7 @@
 #include <drm/drm_pagemap.h>
 #include <drm/drm_pagemap_util.h>
 
+#include <linux/migrate.h>
 #include "xe_bo.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
@@ -752,8 +753,8 @@ static struct drm_buddy *vram_to_buddy(struct xe_vram_region *vram)
 	return &vram->ttm.mm;
 }
 
-static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocation,
-				      unsigned long npages, unsigned long *pfn)
+static int xe_svm_populate_devmem_mpfn(struct drm_pagemap_devmem *devmem_allocation,
+				       unsigned long npages, unsigned long *pfn)
 {
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct ttm_resource *res = bo->ttm.resource;
@@ -769,7 +770,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 		int i;
 
 		for (i = 0; i < drm_buddy_block_size(buddy, block) >> PAGE_SHIFT; ++i)
-			pfn[j++] = block_pfn + i;
+			pfn[j++] = migrate_pfn(block_pfn + i);
 	}
 
 	return 0;
@@ -777,7 +778,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 
 static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops = {
 	.devmem_release = xe_svm_devmem_release,
-	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
+	.populate_devmem_mpfn = xe_svm_populate_devmem_mpfn,
 	.copy_to_devmem = xe_svm_copy_to_devmem,
 	.copy_to_ram = xe_svm_copy_to_ram,
 };
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 2baf0861f78f..bffc7fd5bef3 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -192,17 +192,17 @@ struct drm_pagemap_devmem_ops {
 	void (*devmem_release)(struct drm_pagemap_devmem *devmem_allocation);
 
 	/**
-	 * @populate_devmem_pfn: Populate device memory PFN (required for migration)
+	 * @populate_devmem_mpfn: Populate device memory PFN (required for migration)
 	 * @devmem_allocation: device memory allocation
 	 * @npages: Number of pages to populate
-	 * @pfn: Array of page frame numbers to populate
+	 * @mpfn: Array of migrate page frame numbers to populate
 	 *
 	 * Populate device memory page frame numbers (PFN).
 	 *
 	 * Return: 0 on success, a negative error code on failure.
 	 */
-	int (*populate_devmem_pfn)(struct drm_pagemap_devmem *devmem_allocation,
-				   unsigned long npages, unsigned long *pfn);
+	int (*populate_devmem_mpfn)(struct drm_pagemap_devmem *devmem_allocation,
+				    unsigned long npages, unsigned long *pfn);
 
 	/**
 	 * @copy_to_devmem: Copy to device memory (required for migration)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 0cc3ba9b0502..76f5cf753bd4 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1391,7 +1391,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
 
-	migrate_device_range(src_pfns, start_pfn, npages);
+	migrate_device_range(src_pfns, migrate_pfn(start_pfn), npages);
 	for (i = 0; i < npages; i++) {
 		struct page *dpage, *spage;
 
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index 1a2067f830da..a2baaa2a81f9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -1354,11 +1354,11 @@ void migrate_vma_finalize(struct migrate_vma *migrate)
 }
 EXPORT_SYMBOL(migrate_vma_finalize);
 
-static unsigned long migrate_device_pfn_lock(unsigned long pfn)
+static unsigned long migrate_device_pfn_lock(unsigned long mpfn)
 {
 	struct folio *folio;
 
-	folio = folio_get_nontail_page(pfn_to_page(pfn));
+	folio = folio_get_nontail_page(migrate_pfn_to_page(mpfn));
 	if (!folio)
 		return 0;
 
@@ -1367,13 +1367,14 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 		return 0;
 	}
 
-	return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
+	return mpfn | MIGRATE_PFN_MIGRATE;
 }
 
 /**
  * migrate_device_range() - migrate device private pfns to normal memory.
- * @src_pfns: array large enough to hold migrating source device private pfns.
- * @start: starting pfn in the range to migrate.
+ * @src_mpfns: array large enough to hold migrating source device private
+ * migrate pfns.
+ * @start: starting migrate pfn in the range to migrate.
  * @npages: number of pages to migrate.
  *
  * migrate_vma_setup() is similar in concept to migrate_vma_setup() except that
@@ -1389,28 +1390,29 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
  * allocate destination pages and start copying data from the device to CPU
  * memory before calling migrate_device_pages().
  */
-int migrate_device_range(unsigned long *src_pfns, unsigned long start,
+int migrate_device_range(unsigned long *src_mpfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, j, pfn;
+	unsigned long i, j, mpfn;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++) {
-		struct page *page = pfn_to_page(pfn);
+	for (mpfn = start, i = 0; i < npages; i++) {
+		struct page *page = migrate_pfn_to_page(mpfn);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(pfn);
+		src_mpfns[i] = migrate_device_pfn_lock(mpfn);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
-			pfn += j - 1;
+			mpfn += (j - 1) << MIGRATE_PFN_SHIFT;
 		}
+		mpfn += 1 << MIGRATE_PFN_SHIFT;
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
@@ -1418,32 +1420,33 @@ EXPORT_SYMBOL(migrate_device_range);
 
 /**
  * migrate_device_pfns() - migrate device private pfns to normal memory.
- * @src_pfns: pre-popluated array of source device private pfns to migrate.
+ * @src_mpfns: pre-popluated array of source device private migrate pfns to
+ * migrate.
  * @npages: number of pages to migrate.
  *
  * Similar to migrate_device_range() but supports non-contiguous pre-popluated
  * array of device pages to migrate.
  */
-int migrate_device_pfns(unsigned long *src_pfns, unsigned long npages)
+int migrate_device_pfns(unsigned long *src_mpfns, unsigned long npages)
 {
 	unsigned long i, j;
 
 	for (i = 0; i < npages; i++) {
-		struct page *page = pfn_to_page(src_pfns[i]);
+		struct page *page = migrate_pfn_to_page(src_mpfns[i]);
 		struct folio *folio = page_folio(page);
 		unsigned int nr = 1;
 
-		src_pfns[i] = migrate_device_pfn_lock(src_pfns[i]);
+		src_mpfns[i] = migrate_device_pfn_lock(src_mpfns[i]);
 		nr = folio_nr_pages(folio);
 		if (nr > 1) {
-			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			src_mpfns[i] |= MIGRATE_PFN_COMPOUND;
 			for (j = 1; j < nr; j++)
-				src_pfns[i+j] = 0;
+				src_mpfns[i+j] = 0;
 			i += j - 1;
 		}
 	}
 
-	migrate_device_unmap(src_pfns, npages, NULL);
+	migrate_device_unmap(src_mpfns, npages, NULL);
 
 	return 0;
 }
-- 
2.34.1


