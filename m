Return-Path: <linuxppc-dev+bounces-16328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK6/Mz8PeWmHuwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 20:17:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C845499BB3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jan 2026 20:17:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0wBz13XFz309N;
	Wed, 28 Jan 2026 06:17:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c111::9" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769541435;
	cv=pass; b=A2viXJHUuotDNavgLHrQ9yxxjgk9tKhNduUj/4Mh/W3hXDzdU/ZteiNF8ArFAUMBJmm0bMmsuNvzEBcdNizvTKXs3DpwE7Ft97P4QUhlgoxAA2ctynVt41MV335H+VsTlglKwOwRbz5Z5WT2XsAz7UI1zYWYhNoTki9EHauDMt42Y7rVnl94kPRXTuOVFiQmfVp2nxrCC8Pkg+Jss6nvlAnPLD1jJjm0rg5mxybeqeDz4PPljI1kpLvwxO2yLvei6I7YPppTMiosmfS8vdPxuQllWeJ9uz7Ja5aVti9TmvqhilUgT/Wndbsc6ROADk4rx8+10tqzfVcoE5fQLikrng==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769541435; c=relaxed/relaxed;
	bh=LTLNIBc63oFf76Yq+PVqPIhFZSgRgSAe4MSYtDYn7SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QRBCc0lYQfVkhqJASkNZ5dGjY3kyZQpsNTVLDdLScIIUbSU4WBgUabdhX7NY69SGDQH1fG3cawtUTfcZo7Y+HHSmavlH3J9W3uaUAob5koNwJjAiOb9QLpk4sqzrld9FfwUemgjWEDOJW6dPfIdXFIQV3oee7bv8fWC5j1PIb7l3SSlQnaQRNV4pRNx+Tgo3a4GDToi/h13p8Mm7LX1C4h8L1A5RJDCB6DX3SrvzkQiTvs9qzRUGmpFbXJAu1f6q5ZMIiBbqS82TaskSXD9iLklDdPEs5AhtZEZvzXLVPEPT86bBGms0/GpaZCXMmaujbqDBLXOwnWME/VH56XvKqA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Mi5PRWeg; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Mi5PRWeg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c111::9; helo=dm5pr21cu001.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazlp170110009.outbound.protection.outlook.com [IPv6:2a01:111:f403:c111::9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0wBx5Jz0z2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 06:17:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6VN/8VreqplQ+t8DChaTi20XuBk4LwufxYQ5XdgR6aOuCl/7ZKf3qmyQ9ZV/5tbGxfWQmcF97bglDtQ/4lr0cUihhevq3TxtxqIGsRcce2VElMGqh2L3gfqhIzhWwFiXMbc0t4HRKHPqvKoIVslNniH5mJifjcjURFpCmIc7UF23htRBYlxGIdlQqggogy3WiVm3yTpGSK7lj0kYDSjXM1qms36dGn3uInftaiKlX5aHkmipQ4cHg5nkyBSb+6BeyVo1boZ6TWRN5XpRZTzu1dObmMoXgH1IRIT3bWHLiT3qgjPQeCsxurKjyEjZRjcPi7nTdznhtrgjyuQWqTQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTLNIBc63oFf76Yq+PVqPIhFZSgRgSAe4MSYtDYn7SM=;
 b=qQsbamEeBpCtNOLUwqZOZIhifTY3TxvsEt3shSZBol4Z8DhWXuywRC0a1lB4jvbbvKsXx5uRc8jKWiCbydp+JYRcK7K2qecfzNvHMB44ssEBTdnSksaciyGaLFklLBsK05P6uDv+q1D1FeLwtgbRm0f1zw9c1hZIB0ikokFfa48/cfIZz0qwW7OBevNchG8I4TGhTcqUFkw2mKJWBKcl5HFWRYj6t9Z7LStCwABfv4UkL8OWquntOgJ1RzB5t5pW33nfHKpviJAutffAmho5NMvemFqJnp1YoJ5+U5ivFSwzEOjq4qSx1hahKy/uSuZ4H2Qeyyh+LfP1ZoEJdDJFxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTLNIBc63oFf76Yq+PVqPIhFZSgRgSAe4MSYtDYn7SM=;
 b=Mi5PRWegYb5gx0+zXFJPE/mLDDb1WwBuSMBWsFjhVMyVFo4qD5hPH4uPDVM1qBy2Tok3T8tDlHB6rcoRPvFJ4r9TCVNj8yk5blETwNtvZ1165NRRzjMfnPAPK6+sVrX4iJm7XNHtFd5VOX1NC517vXCY1B7P2sb56HH/MjUH1K7LRJqhk9Rqou/GLkuIzAOURsG5ZB+UPSi4Ic+s1+PE7qFOo5CgxqAu7NtApoc71o3QYSrMlL+tBU5GkUVNmALdkTX+k7s2yp8BDzDhvO4xHNboDGoZHLeOmrYtTWzRCsgoydQXpBrILKsloUeOVcoz6Ikq8/FJ7NAWj6fwksvBXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB7767.namprd12.prod.outlook.com (2603:10b6:8:100::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 19:16:46 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 19:16:45 +0000
Date: Tue, 27 Jan 2026 15:16:43 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev, chleroy@kernel.org,
	mpe@ellerman.id.au, maddy@linux.ibm.com, npiggin@gmail.com,
	alex@shazbot.org, joerg.roedel@amd.com, kevin.tian@intel.com,
	gbatra@linux.ibm.com, clg@kaod.org, vaibhav@linux.ibm.com,
	brking@linux.vnet.ibm.com, nnmlinux@linux.ibm.com,
	amachhiw@linux.ibm.com, tpearson@raptorengineering.com
Subject: Re: [RFC PATCH] powerpc: iommu: Initial IOMMUFD support for PPC64
Message-ID: <20260127191643.GQ1134360@nvidia.com>
References: <176953894915.725.1102545144304639827.stgit@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176953894915.725.1102545144304639827.stgit@linux.ibm.com>
X-ClientProxiedBy: BL1PR13CA0391.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::6) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
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
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e983b3-abe6-4aed-6098-08de5dd89cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3qPYKlZscXyvXWAg5dsCtV18GviQmLQ+QsXU8dB3eFAbI/kGwP+OT4Aa0Duo?=
 =?us-ascii?Q?cMLH5klSE/195ko07CuvCcN7Rf7et9aGy2dpqOOvdOqOA/+3+bOLb8H5I6bs?=
 =?us-ascii?Q?CSLhPh2s+WEwfwDWpgZiM5lo3MAJTsTOEYSbRs07CaXaU2NHrp6bv32SStc/?=
 =?us-ascii?Q?e0qD/vkWr+8H2Eu8BtQnGeoFKB+KptF0DUlo1lG19CHknQQgwg0/h/pw8Rhy?=
 =?us-ascii?Q?zAeXDztwF/nfTWPpyIHT0sHW06XUhXajBASJ0KypzC70Vhjn9+ZcrCmuevQV?=
 =?us-ascii?Q?FOYRfibK5aYCfcgQYJJ75dFQyfk4xBQHrh6t/H65/s58Fm8cvfKJJob+Svnp?=
 =?us-ascii?Q?csi5O3U+cFjWkKbK9drB0wu7F/Gcs2zIEomYDktauYV+Fk/uJl7N38fWlbtS?=
 =?us-ascii?Q?FQkUai6nAs8vbyGPvWmqkhtFy7c4VIizZaKIbSUaFysbOcZAx88LMPbqLeCX?=
 =?us-ascii?Q?gn9kpwN7a/Exyif858xhJ6eY3fOrFSKSzRxJe95qslepBkwd1Q5Ivfot2Qzy?=
 =?us-ascii?Q?YJydbS6ibcoTDnAaoL276CwsmbgddCBZUX//wtGp/8uTnioiMsWyuGmcxwyy?=
 =?us-ascii?Q?lvR1h+JA4NDNoXtJ66oSi0CrO3IeHomS/amjGuQNCyRx2o5Wun3fGY7v7ZzJ?=
 =?us-ascii?Q?tpLpqmDYaDvYpsq6cNu3+DoqY+DoQvSBk4L+gxUlMVe0nNscRv+GxlkT6Oy1?=
 =?us-ascii?Q?YEpci5AaTZ+/eB6eIW3biElkV+IiLvUur/mEBB/A1As+W8GUGzvjdwbq4HFW?=
 =?us-ascii?Q?E+fAADMZaOpfWAtBuPwTVSYKWu7kV7hGu25QG9dp00UDnkyU0ZxO7P5oG+b9?=
 =?us-ascii?Q?qJjaYeOYYGlJCqG0Vvvg2nBYdWIBMuSn68WGw4Xi3VnP0Go/vVtP7fnaya87?=
 =?us-ascii?Q?6NJ4Nhj8B9F0iRo9AG1UldvwDDUVk/0o6kyNbuAsy1nPK6hNlsQkHVjXaAw4?=
 =?us-ascii?Q?29xA6sMXzy6XQhflUpt9BTR5Y9uKmfACTiTTfq16Y5xbsoRo7OP4oOCJdVBp?=
 =?us-ascii?Q?kZSpU3/RhUTCg3gZHjDBm6eZO9OaR+61JD0IwkhaxjnyEG6hUbFUZZiN4S6a?=
 =?us-ascii?Q?iYQfdpVEsPfMfn1boEAAnvIg0rMV1LPCzS1E/+U37MD4COIsV5axnCXDYdkJ?=
 =?us-ascii?Q?7BmkYfCkaOadjpBOJuSw/pTCNkZQfyO6WL6gft1bw5YU5nLu2MalkjmIuj4a?=
 =?us-ascii?Q?CaNefJknKdkE2LpsZfOXe7x/QZv7rHwnPo06FquB8WqYNSniFdRXQ1qjE/jZ?=
 =?us-ascii?Q?XINtD/rn0016uOGdaDWbP1tJXccu3aBqi9TpAuid+/7DyaCzoWDSTdcvEJAR?=
 =?us-ascii?Q?fvayMJP6bylby5zhCoF7DqjF4xA/yDXBpPWjDUsaqSw/q3I6s8Pv2b27AmT0?=
 =?us-ascii?Q?QMptLspWB72ht+xfqtr75JxxFeThU/dXseCp/8kvx6nNtAt+qtnEsGxLnd23?=
 =?us-ascii?Q?lbW7cFdK1Bdhjmi5JkZUEGdUCkVoQtIrCYm5GI3KfPMEqz2CfNLETKV0TxZE?=
 =?us-ascii?Q?i+z4YvIkt5TrGHXbyGSk69tpUzFseJ6Mh9S/+yXe6ynBzmIz7Ie1H9TT5rqQ?=
 =?us-ascii?Q?HsxzyP3Alh8OjlMpL8I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2WbKK7mSaLo9FeEIjvVYwQ9LAg15Grtpxj3ujpO4hPGy7TLYHlknT1aSrEzr?=
 =?us-ascii?Q?6PV6SFXDqKdYSpTXEqAfRzMs5kB5PL4pRnVUWFByERo6OZnmKkZUwgKo0Wta?=
 =?us-ascii?Q?HA8HqV7WlUVtXhFcwWjRHSlnVezfVvpmFZWD440+OQi18Hw9I+T8VxlaAhyD?=
 =?us-ascii?Q?MZpG1PC91EUUsNGI1g8IV0G7WIebaoltdiIL8DzSopQU0VZ4q2Ig1WxB/EoW?=
 =?us-ascii?Q?79d2aMNY1cN74klWy5dQNwwyQHhkgQAp97QvaX8b6twsfATRJBrkethwPaht?=
 =?us-ascii?Q?vwg8G1W/bxt6TBXaFmCoquApfd65/yXSJH2J/cJKa6T8Mf2Xmsd61sZq5CKH?=
 =?us-ascii?Q?kwn1OFyW2JKV1L9JMWOxKomyu8OmdHbyT4lyIcZ1tSVUk0FWk6oz6F19vTkT?=
 =?us-ascii?Q?hVh4nhYkKrmOmiBRYWkLWVnRvx43mPn5sE2ainGboTrVtOCqQsgDKyW0EMF7?=
 =?us-ascii?Q?cslK0NmleKBM1wxRie9dMURcgTC1rnE4W1ex1ww6LK3xJ7Tj0CG44UShAQ8X?=
 =?us-ascii?Q?gz8YdMxdN1+OrBs9fGIPPz0pJh7o8U2VHQY/GLU0DdsWHKxKk4p1jpn+Sq9y?=
 =?us-ascii?Q?dozMtqvepV4/8KQdytBrYi+r3jN/pOBjTI1Q4io4Cd1j+FKdqVbygeJVRK2g?=
 =?us-ascii?Q?gte9AfFyTUZuq2cy5CcLuuWtzyp3IVb06JIxp1xWiLAYbgZghSnHi/Z9gaDt?=
 =?us-ascii?Q?ZhEH1U9G09tnak4qTYEWINvy1N05Be/i8f1u+a4cHEP8V5UoD5uH899N0n9C?=
 =?us-ascii?Q?VaKIzXyV+2w9iF2KOS2f3apnqVxDLeK87HU9HPgXoebvnSxG3DLTOejHKsCo?=
 =?us-ascii?Q?c3OdAeTqUHmnaPUScfPVn+CKZ/5tGDl2CY667yWQh75sPzXvOUnA7p6LU8q/?=
 =?us-ascii?Q?8YNfIwOgaermcpqFB0Zg95eDj5bQgDCL7EdhdDv/24hGyLuC7gWv9REfGk+W?=
 =?us-ascii?Q?vjk6pxmK2qf3ZJ6TvLaUfTjDHuuhU86Kv2YXXFkEKu3FgWhsS6xX0+De2S+u?=
 =?us-ascii?Q?0wIhF+pyC6Cu3ioA+IAHy9bgk5kSJ1Ry3QSBizo2OzV66iRjSFUIm/nnBaPR?=
 =?us-ascii?Q?OUcP5NrsTXQSBOOUm+jle7puJLzSDj6w/b4WeUKCYRab1eAtTv+JjkSQym7u?=
 =?us-ascii?Q?8RNP08qttjZY3vTteJZxsMPorA+x2B6q2wsNhEBNtAbbyztdQnc7O5vRWa7G?=
 =?us-ascii?Q?uPkzCF5tGpWqlOQ6ues+zv4S4RtKApR70JRCHB6ShWQ+kZR819V8rZfQ17Rd?=
 =?us-ascii?Q?GK4mvwZVLCKfcSoK0lWxi23aP9Lw+xFC9PadxXnnqXRwjL5u2DT31hhP9aw8?=
 =?us-ascii?Q?EoKXnubTeO+0s+j5xDifE558js8Z1Ayp57czmeBOkmuVRiiguG6wb7rQdQxh?=
 =?us-ascii?Q?17Xi8VEc23wEaA40jY2o9WRDdZd3zx7iOv0COyTfnDkrJVkLr+5ZmpYGQIHm?=
 =?us-ascii?Q?pfToEJ2awN61C/EvUb2gBMzTiOYo0IryuQpO3DaYpZWsLckPoP8befDG3qlV?=
 =?us-ascii?Q?zqnJogp6tlrLyF/OBbSiOqSL/nHUe7txD5RkwH40tjPxbQL7zipmFJthcM2o?=
 =?us-ascii?Q?KxM1RU5ARTnn4YNGg43T87eF4pWW6yLjBlm0A86aWYDDgfstjYEt0bHQ4cgi?=
 =?us-ascii?Q?CkvXUub5/FZiouCP5S5VoIQgOLW7raXIRqWkbpO1cmUfabJOdyvhKq8C4zrn?=
 =?us-ascii?Q?x5p+vSKKvo5NN1tg7siwp9M5vJThImybClUg00R4wf7Le02BbF+h+XYSk+QB?=
 =?us-ascii?Q?oAHMoUKYkQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e983b3-abe6-4aed-6098-08de5dd89cc4
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:16:45.9331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsF2szYe+G4WQhUJwWSAWnKqDZuf2E1wkWMC9Vh1hkJUnlUU5GO+Y6qLJqxUFyMx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7767
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16328-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,lists.linux.dev,kernel.org,ellerman.id.au,linux.ibm.com,gmail.com,shazbot.org,amd.com,intel.com,kaod.org,linux.vnet.ibm.com,raptorengineering.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:sbhat@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:iommu@lists.linux.dev,m:chleroy@kernel.org,m:mpe@ellerman.id.au,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:alex@shazbot.org,m:joerg.roedel@amd.com,m:kevin.tian@intel.com,m:gbatra@linux.ibm.com,m:clg@kaod.org,m:vaibhav@linux.ibm.com,m:brking@linux.vnet.ibm.com,m:nnmlinux@linux.ibm.com,m:amachhiw@linux.ibm.com,m:tpearson@raptorengineering.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C845499BB3
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 06:35:56PM +0000, Shivaprasad G Bhat wrote:
> The RFC attempts to implement the IOMMUFD support on PPC64 by
> adding new iommu_ops for paging domain. The existing platform
> domain continues to be the default domain for in-kernel use.

It would be nice to see the platform domain go away and ppc use the
normal dma-iommu.c stuff, but I don't think it is critical to making
it work with iommufd.

> On PPC64, IOVA ranges are based on the type of the DMA window
> and their properties. Currently, there is no way to expose the
> attributes of the non-default 64-bit DMA window, which the platform
> supports. The platform allows the operating system to select the
> starting offset(at 4GiB or 512PiB default offset), pagesize and
> window size for the non-default 64-bit DMA window. For example,
> with VFIO, this is handled via VFIO_IOMMU_SPAPR_TCE_GET_INFO
> and VFIO_IOMMU_SPAPR_TCE_CREATE|REMOVE ioctls. While I am exploring
> the ways to expose and configure these DMA window attributes as
> per user input, any suggestions in this regard will be very helpful.

You can pass in driver specific information during HWPT creation, so
any properties you need can be specified there.

Then you'd want to introduce a new domain op to get the apertures
instead of the single range hard coded into the domain struct. The new
op would be able to return a list. We can use this op to return
apertures for sign extension page tables too.

Update iommufd to calculate the reserved regions by evaluating the
whole list.

I think you'll find this pretty straight forward, I'd do it as a
followup patch to this one.

> Currently existing vfio type1 specific vfio-compat driver even
> with this patch will not work for PPC64. I believe we need to have
> a separate "vfio-spapr-compat" driver to make it work.

Yes, vfio-compat doesn't support the special spapr ioctls.

I don't think you need a new driver, just implement whatever they do
with the existing interfaces, probably in its own .c file though.

However, I have no idea what is required to implement those ops, or if
it is even possible.. It may be easier to just leave the old vfio
stuff around instead of trying to compat it. The purpose of compat was
to be able to build kernels without type1 at all. It isn't necessary
to start using iommufd in new apps with the new interfaces.

Given you are mainly looking at a VMM that already will have iommufd
support it may not be worthwhile.

> @@ -1201,7 +1201,15 @@ spapr_tce_blocked_iommu_attach_dev(struct iommu_domain *platform_domain,
>  	 * also sets the dma_api ops
>  	 */
>  	table_group = iommu_group_get_iommudata(grp);
> +
> +	if (old && old->type == IOMMU_DOMAIN_DMA) {

I'm trying to delete IOMMU_DOMAIN_DMA please don't use it in
drivers.

>  static const struct iommu_ops spapr_tce_iommu_ops = {
>  	.default_domain = &spapr_tce_platform_domain,
>  	.blocked_domain = &spapr_tce_blocked_domain,
> @@ -1267,6 +1436,14 @@ static const struct iommu_ops spapr_tce_iommu_ops = {
>  	.probe_device = spapr_tce_iommu_probe_device,
>  	.release_device = spapr_tce_iommu_release_device,
>  	.device_group = spapr_tce_iommu_device_group,
> +	.domain_alloc_paging = spapr_tce_domain_alloc_paging,
> +	.default_domain_ops = &(const struct iommu_domain_ops) {
> +		.attach_dev     = spapr_tce_iommu_attach_device,
> +		.map_pages      = spapr_tce_iommu_map_pages,
> +		.unmap_pages    = spapr_tce_iommu_unmap_pages,
> +		.iova_to_phys   = spapr_tce_iommu_iova_to_phys,
> +		.free           = spapr_tce_domain_free,
> +	}

Please don't use default_domain_ops in a driver that is supporting
multiple domain types and platform, it becomes confusing to guess
which domain type those ops are linked to.

You should also implement the BLOCKING domain type to make VFIO work
better

I wouldn't try to guess if this is right or not, but it looks pretty
reasonable as a first start.

Jason

