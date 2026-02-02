Return-Path: <linuxppc-dev+bounces-16516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAZFGaiMgGkl+wIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:38:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA12CBCBD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Feb 2026 12:38:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f4PjY65mhz3cJk;
	Mon, 02 Feb 2026 22:37:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c112::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770032241;
	cv=pass; b=flgtpG0WgWLZ+tW1NniRwLpxcm/sRP8AGRHyOaMT6ox/pZMpaNjGrjDC++95XLMei+Xunc10evY5BL0lqJmyE/50sIhOwyPz/LVPdu0v26uXRptTCrFzrJdIVHsTQPeCL+NB9T/ff2fxckW66aa88Jqrb8Imv25A6tU6rEM/nHbiVYWSrs3bugxBRZF20zp/ei3bMCB2jtJiq7xx3Ot05fai4Qdzcq1bwSuAsDdLimIWfCL+ed8VoQwPWg1PdvuCrI7c1TpCls40CVRZJJbzsYqoHOjIwRyis9M8iD6C2IDLn/JwcawvPXjlzgqbeAMDIvpIAed7xVaMbYtgiRF5Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770032241; c=relaxed/relaxed;
	bh=0cOd2na0yunbUh/HvE3nQ7bJd9gh2MU/muYJwnVokw4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rye0XwL/PUOfzsLLiVDLEJmlYXbjWJ6xhfkV0dYL9nZKzDCel2qW02n+weCxjRLdgNd5sw6+UmnBdsYln5NmX7G2nfS0FWVD7TCVzY7gSJiQjIEgrj7eNF73SiEsnIJfdv6igMWmMlPwA8gZPeH1Ys8CXFPYa06EQlIcXw9SoJ5zqa5XxCfY2hY7EWEExELhXv6Wli5As4wGWbzPuYzavYniRtudd7cdpzpIyoks4WHpHg13tSWlqC53nL4pSzniXaisLuCxvP3R9hY/6i2dYIZQte5qjj6yzJEZ4E8iCs02k4FFascpG+oLbtN+D37GU53jwk/4melG75V+DdxifQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lRdKXw9w; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lRdKXw9w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c112::7; helo=cy3pr05cu001.outbound.protection.outlook.com; envelope-from=jniethe@nvidia.com; receiver=lists.ozlabs.org)
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c112::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f4PjY1Rl3z3cGg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 22:37:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErCqhao37z18QnYL3BFj0Ol7ctrLY+aT7OpGQ5woPXFJXu5qwZ0FT4/KKw4JCDskDmW5JR1MjfKt6pdO5JUKMjulz3OtutdPmEJr3PqypilH731WLqh1ZFr4xttps+TpIgxk8NYckSPQRIOhFo6N0QS7aRrIt842Ah1PXIJ9M23AQ+5vA75S0NIpOrBhr2/rTBV3JLypWavEiuEbnvzuBwb2HsjO0Vw56QtV9fkvera7WVKa5kdi1SFdLimZ5AzBFAZKnWUvpaGSNUX+TQIx9u8ugcQQiE4v2DBUxtIQ24mC/BmT1rFm1w/lLCg78N4aDDJLbvJ5lBnIPaOmG4g6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cOd2na0yunbUh/HvE3nQ7bJd9gh2MU/muYJwnVokw4=;
 b=uuvjNxJ+PSqR92UjMtjRuUXzkn613KzkVyPDyDkVfXwvWrArQ1YCo6Bil7adVhYrKIYocKy0yvK/8/WBHN4fRh8RVtRFjUcIfZxawT/21hHIpIDCvNfFJmRS5SnXlBIvjWf7SrPUdWVUms876E2iKcAqD2qjoJ5R/OvbyZ+PGeLLs2IpOL2rD7nm77EzpceVl/VfuLL8y/3KN/fVMrPnP5pMJLMlprOphHpjJI7uoejBh0aLJMdAkx/h8laIAl8y9KlIl+/SHBM27SJdmqo3NA//Wnk3KmFdw9yzr0GckE49yuH9d3ll0LXo3ZEnvZW2HZhvBh3OzCMaR7iD5Do5Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cOd2na0yunbUh/HvE3nQ7bJd9gh2MU/muYJwnVokw4=;
 b=lRdKXw9wyxXBrrgFpr+wr9AZhOJBeI7FhBQD3hfMrtH3cXCiWw3AWoF9zcFa0ZZ+e+eooSvg74kNJG2foJPGxMwbh1aZeTj/ZJjTY9Ph7oWDjPjxqxquQ7ursuycLWCUuxsP+Sp/swv8n1xtOcgCfbx+ntVQXmEH1ixsbKlnJVmN4Dso1UiTbgxsdOtl9hPlZXcgylUXwX8/UosZ5wYhONo6M94qHmLmRUV0nst/wulc8CJ6Xv1puShrUkqS3Krf6I4oKBCmePBZTIiFw0hSHqex3OKWTH+5GQciIe9ewiflyP1tkJtGhBply4jBCpTk5gyxhnN7V1HfGtJDlLNdGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:37:17 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:37:17 +0000
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
Subject: [PATCH v6 09/13] mm: Begin creating device private migration entries
Date: Mon,  2 Feb 2026 22:36:38 +1100
Message-Id: <20260202113642.59295-10-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
References: <20260202113642.59295-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To DM4PR12MB9072.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 0a532361-ea4e-4221-bce9-08de624f6b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wXZJtd8cU3aX8oaSAJ1IFlK3YucGpvQuMELginx2RDSI6KxkzQXDXYkiRGth?=
 =?us-ascii?Q?X20VaxHt7aElaC3RtQeuSQkaFRFj+ruqy40hJ1GX4v7+smKA8+MZ3u/O8BCI?=
 =?us-ascii?Q?XhwEm35AWoOVczY5PPPyIVsE+h2HJZ8Sb/WuCpGkI3GRGwxSHPMtAbJmYpWk?=
 =?us-ascii?Q?28zHOdU94FrELMv5YndKMyQy/pwBc5zcd0WI30nQNh1RrB/WsVboDR9kpN3U?=
 =?us-ascii?Q?imj+poXdjxMvelAK7sLjlEYypRtgD8ld6JClU42XPg+0DtMqfglIPl8NC6mr?=
 =?us-ascii?Q?QbgTcwaVnvaqGuOA3hmuP93IJwisFRd6GvsHMZbUG6H04GNw+DEzfa+NFZxU?=
 =?us-ascii?Q?iHxj3tKElTi3EcwOy+g8rxrcgxUobp3cI0h8yQikt4PzGJKMtr/UMz6hV7HM?=
 =?us-ascii?Q?MJaJQtSW34Yi0dW4QFkUXI4863f8Pomj6qt3XYL9r4fJOMMqVUlx9OJzC39M?=
 =?us-ascii?Q?IlHeWqG7/Q753VUZbhzpgQZh7GXwfD1g+efUkh3a3eX8gT1JTdEl9YRhbZ8K?=
 =?us-ascii?Q?BS2DOyFkDs48RtqWGLtjLIsRUF3EpD5Mupmdt5JS76SE0E9OYg/OudSHqhgd?=
 =?us-ascii?Q?rZVBSbSB1aNGvpTQqrbUlpKG5nN0MnnJ56nMfF9DEHw5fyr47M6Ij8P+VP9j?=
 =?us-ascii?Q?pPnk5Di5TNLYehzVhNDO79ILl1z1DFvLbYMxxr1IssTZCaa9CAQAPQ6rU98p?=
 =?us-ascii?Q?QMWuevdpNJUSM7xeNNXDLnJRuGbIn+VhxJ75qutcAQK6KC738KC+zQH3SbDQ?=
 =?us-ascii?Q?+cxthpoHrqXQaUNo0np9qnbgxqphARIjOIjBtwGNqBjuGoEtdf0pkhGzWUqi?=
 =?us-ascii?Q?daxGUGTeCotgAOgAv0fsXI/ft/l2ktyB89RMWnJ0YK+UhTGbJYITEJvNmQNQ?=
 =?us-ascii?Q?IU8vJeqkm/CT1W1ePl4eXuPX8PgWJM4x/3rJZJc3wmRdiY0gicp9n2QkhQkt?=
 =?us-ascii?Q?wNIsQNCr/7lAgpOvO5k1Bi0Ir/IyMkrK63d4AI/CmvLgO6ftGov95m4uD0rK?=
 =?us-ascii?Q?mQCtIxZT+xA6nlSEgLOfJk1mmJslOVrSfs59+19lY5qqvPTsiYYn/ovmLWE4?=
 =?us-ascii?Q?Q76oI4b/qMQLqE4FTooqQQd1SmDrSY5p+kp1fWUvs1MFfU76luBTKuWiVICb?=
 =?us-ascii?Q?ZC3SsL/li7dWfS9IOZim/3J4UXyeHiV7KeHDZeO65V5jKvtFGyFScLc2WCrn?=
 =?us-ascii?Q?U/Yr9TSk8r+vZGKZRJsFjGECyUOQThuFxfuyWm9ZybCmxlhvHj7S+MQOxgsb?=
 =?us-ascii?Q?0tpVoPRxvkThG/FEOJpEzd1xyQJL/XiA28m0skGjQT+bGK+UZ3qbD239umf7?=
 =?us-ascii?Q?SbaeTE8Z39llSx5OdoE6vYHgNA8puBJE8a7h7o/WTHx2mt/6nHNCWO1exupn?=
 =?us-ascii?Q?/ST/C7CRqRim/vYH6fvBv2ik188V+zyPT9xLd/lHmE7uyoxatrXw31aGcHlD?=
 =?us-ascii?Q?OAr9gB2fgCw7BK9BLNdZTxL85CYR2QTQun1zt6pLV2LISEpv8+4Sf+il7zoH?=
 =?us-ascii?Q?/KMTfGsrJLHvmlPedaOMK8o9QXVxcq8soU36sE2CFsBqOdHKZ/BIbea6cdJQ?=
 =?us-ascii?Q?uIPkyYwPtVXsDRO8fyA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB9072.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LqPqhE3JzrAnI6utcomai7se7K6yf0THMCzlRW/+WIYx1BwaCpbSblcp+sj6?=
 =?us-ascii?Q?Hy89lfABxMRakaiaKLdrLUok5MfOY6hxPF++jyaiBZpm9KHYdsiTACeN9L53?=
 =?us-ascii?Q?8UdcFQ8FWPbheBO1XfFSFfc6F7a69mqystxUENi5PsJmyNPIXuiozsyWitJd?=
 =?us-ascii?Q?DViVQsf76wzUMM+DIlhsKspPA86DpDcDfwGU8aMUUV1TiiRQ1MbDRBKxuZkj?=
 =?us-ascii?Q?L0+7zpzI+LTEa78FAnCCiuH4suOSGyU7Ob7CIGrUQOVD9wiRP/88hoBRKH3B?=
 =?us-ascii?Q?vnImrvHq8n/2r2wXmKy/R43nlNGlFu3fWah1pd2nnWlGIjLLSudDqhhav7Z1?=
 =?us-ascii?Q?opCtCn8AINDh+jndeGcoND5mWzy+MKBpW7pHSkdmF/V+GFC8dR35mfj0v1FK?=
 =?us-ascii?Q?RHIeJVNTw7+esoC+B3LPYzakX0GcS/P/Rykl3/8mE5l1CAM9Ff4+ltjGlT4j?=
 =?us-ascii?Q?S1eKGRkmr8dQwt+I2/AVFjVJxL876yR7asMXYKr1e6AjVoRR5vc9CpmiPt0P?=
 =?us-ascii?Q?s94linuwPHOeYDTcHSESP0QnRPs8eWU3gau4axr12TguALuvVjbH7DE9fpTB?=
 =?us-ascii?Q?/pEfxkALT0Kz5ooflfItAznMerjoHfjIPCBWWVu0AFYhJ1zuhlRAUg/YJ11/?=
 =?us-ascii?Q?gLISbLzySF6wCNn8/EfRZRnFNn3i/i/WG/Rh28Xfhxg7E67J1pBwNHuGR96L?=
 =?us-ascii?Q?QAYwN/8RFB3dIoOHaUvkVx4quU07K4BnPkJyoDhS6ZWFWKwVKq6uCKJbUE48?=
 =?us-ascii?Q?dkw7DrUjnFO7AMm9LMXE2S4Ga9f3VtQsShksilnHwne6UIwiP7krr5DxdLge?=
 =?us-ascii?Q?WV7yFD7HeWvO2c74wKymbUrYNuys5QwwuX8vCxejyQbwcWWkq9PFcHWG8x4n?=
 =?us-ascii?Q?p2V/qTdRA8pXe6tzQJvjwcdr1/6kLk9BuOKeHvz8vuexxQDdXmqWeJtk7sYE?=
 =?us-ascii?Q?H9P+ye2l52Vg0sJzHLEco/58M9UfMmSkgQ0OGSUysmorwzjfZGdGe9NHRtd4?=
 =?us-ascii?Q?WCNgdj3/IhZg22NvJ7vrv/rSeoOF1IopIeOqKcttmS+xb3ah8JtsS9cdyvkv?=
 =?us-ascii?Q?XHgya/Erz8KR6u8q/yZjsSnWtJYC1uO+8z5vXkI2dq+1e0MHCjlmVpY8y0sz?=
 =?us-ascii?Q?SIqXWW6mIQFEStpCKg/i/IRsavJHckiGL78ypK1lGsGYszlPvsSCZaEx+OwV?=
 =?us-ascii?Q?+Sn/lO3KnYUO3Tl9ktOjs+CPnrjkqM/P2Cy33xZMfqTIJyhzlh0hYbmBFfTi?=
 =?us-ascii?Q?2xdfwu75rXBEndh2IEsd9YMKVKXqOwlXYe/DWiIg+fzcS+HcW0jxAmXkzfJ4?=
 =?us-ascii?Q?lRGxfe7oSPtA1ofWVR6CbquwfOFWpjdeFU8NKdmpuS7nHdVzLSGBT4/8xMrL?=
 =?us-ascii?Q?KeR5JirevoYt/W3+Mn6gt/Pi8wktpFCKwdYhcn+jGpEsy7WDS5N+VTopRD5h?=
 =?us-ascii?Q?msuyMU9CgzL72VgY6RfAwfwNa7CVtMxsXKIXFcqfmj2v3BCS+mohPqPeSnYh?=
 =?us-ascii?Q?FOymS+32VG8xL/qo0J/7Pss98cUQ1UePzb3speLuY9MngSUeusx3DqTgHMVW?=
 =?us-ascii?Q?bMs8/grf9NeSRWiHTXDggEn4yeYui0kQfkvTA3GpgmFVyN7qNbHBpdz8lFzY?=
 =?us-ascii?Q?yiBSW/bGslUmyAc6e2HAuX0Q6y7MS8kFNZnzuTGzYTctQcE3yDTfAUehr0ix?=
 =?us-ascii?Q?GwmfALSUMYqd0Gnzm688TzTr3Wb0Hs3BiJd83G/uT38fhqxIYkxHA2YudLwF?=
 =?us-ascii?Q?/D/QzCNeDg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a532361-ea4e-4221-bce9-08de624f6b10
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:37:17.4220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2jckmhMB5pcJrKJl9adF7h2ToT/gKkHt+7li34g9swYQtqksjEpjfZ7lR/NSlgXmKoD7wAsh2uMOyMsA8ZWcw==
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16516-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:balbirs@nvidia.com,m:matthew.brost@intel.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:david@redhat.com,m:ziy@nvidia.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:jgg@nvidia.com,m:willy@infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:intel-xe@lists.freedesktop.org,m:jgg@ziepe.ca,m:Felix.Kuehling@amd.com,m:jniethe@nvidia.com,m:jhubbard@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:ying.huang@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8CA12CBCBD
X-Rspamd-Action: no action

Update the migration entry creation helpers to automatically create
device private migration entries when invoked on device private pages.

The corresponding softleaf predicates have already been updated to
expect both migration and device private migration entries.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v3:
  - Provided as an individual patch
---
 include/linux/swapops.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index 220627cb7fff..8b39983792ea 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -206,6 +206,10 @@ static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 static inline swp_entry_t make_readable_migration_entry_from_page(struct page *page,
 								  pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_readable_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_READ, page_to_pfn(page) | flags);
 }
 
@@ -217,6 +221,10 @@ static inline swp_entry_t make_readable_exclusive_migration_entry(pgoff_t offset
 static inline swp_entry_t make_readable_exclusive_migration_entry_from_page(struct page *page,
 									    pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_readable_exclusive_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_READ_EXCLUSIVE, page_to_pfn(page) | flags);
 }
 
@@ -228,6 +236,10 @@ static inline swp_entry_t make_writable_migration_entry(pgoff_t offset)
 static inline swp_entry_t make_writable_migration_entry_from_page(struct page *page,
 								  pgoff_t flags)
 {
+	if (is_device_private_page(page))
+		return make_writable_migration_device_private_entry(
+				page_to_pfn(page) | flags);
+
 	return swp_entry(SWP_MIGRATION_WRITE, page_to_pfn(page) | flags);
 }
 
-- 
2.34.1


