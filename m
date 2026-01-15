Return-Path: <linuxppc-dev+bounces-15816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57092D24209
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 12:21:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsLCF4M4Mz309H;
	Thu, 15 Jan 2026 22:21:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768476073;
	cv=pass; b=mG8DnSWmVbxSS9MtvayrGJf72Ri9dsTdc6P/x9Hn9nqqSEzyd77K6/YnrJ+wQgqulieUJf8/zD8ioPrn242cBNOc74A+aULkUjz/dLPK9/+MpPgd2ebrvD3p3MGswc5m2/mro6JzFW6Set9/Vmuww3ZsMWtNtlWQqGn+5aKElUZnipP6htpZpS5droENoWtehXK4zkrzcRsOD1i3QljxpkKQ/MEeL1+/7zjDHoagxhT2YllT3FTTLY5+xYTmhPBWt5hhi5LtJgXROEs1yR+ICUthQouWWOY27edfO7f000kqgxYcwXPDAHlr07yhewCvtL4lI6IcoPiZ+aj1RwpfUA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768476073; c=relaxed/relaxed;
	bh=iG5z4qJ47wGgMxBoS9z7MA1vAnuplQPY1b8Z7zIarYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GLdyyia5g0PF/uA16XohEQHPkyZA+IfTy27ynfwg3uT6L0rvifSeOC5VrYDZPwaz271WelPNLIXuwMJWMDslN5rClLx4zqvkMDY1hgeSYajlH5oDldhjbOxeG3wiydVwKy1zJNHC2tFegshdbrXBG837o0QynD/DOnhC0HHcdjF4mUG1xWFJOvkHOp2z4EpoNkVPzeBiqd9RMLRa+NAn5Yl7sCCOxSFRJaom04YcdVYYQvXCkMWVCv0MGMowXfXSXucCzt8YD+qAfVA0WUKvry4FHVqpAVcwKS+RYyXgaoWnyDxqilGcQnLiMIyH+FON8AUHeIR2PX+ne1zC7qKdxQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=gsLj3xvr; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FmAaMh8a; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=gsLj3xvr;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=FmAaMh8a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 6037 seconds by postgrey-1.37 at boromir; Thu, 15 Jan 2026 22:21:12 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsLCD2K7tz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 22:21:11 +1100 (AEDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F9bMXZ2685997;
	Thu, 15 Jan 2026 11:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=iG5z4qJ47wGgMxBoS9
	z7MA1vAnuplQPY1b8Z7zIarYc=; b=gsLj3xvrWCEMw5pW571P4AHgMULoJ0pZXP
	0Dz4liXVbeXeSoBeONjSe/hvV8ClXTXHMcLgFfQSKcSDIzd25dcG91uGybSYbR7v
	DY9+LZ8xXJlQuwSKVg13l+c14dGKWQk2nlwaWxNyrIMbfGIdVa000zW3c9G0Ix20
	XfbLPta0bZA0zdiXCIsW8ZD/d4El1vNzJjWeNBDCXPGiJdF+5NiYieGIBIiWOdH6
	3rUrWyWNadhLxp56mAJbH3FQ3UCCfR0xVCGPkkdU2rBpDo7QAGJvxEU7MTLLNjz4
	4grQFceEf3jNiJVVMEPqipSWuPks3oEQpAVwBRl248tSVishTF2Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb7ga5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 11:20:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FAvbFu032756;
	Thu, 15 Jan 2026 11:20:42 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7b7xe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 11:20:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SU9r40eoih1YcpxLSrpqs/3Jm0hRtlFpyG+zKpbOFvwmDyvyBhNIu7OEx7dhHECcq3gBKDsXz3FRBWVZak1xEFnf69MEebX7mvjo5z39kQyzldtxNoYbin2JQpadBJMuY0hFVKrr1PUUPpuWjLyz1AatksCONmwXpmgA0hrN8Ob22Wd5JDMfNm6mgrJL9I2ZuCqPMAh8FHxEG4KDG2y6r3mY70y+DC0zy2x0ZsZFIEkqTRor2ZJzm3tuheApr2byFYpmz/ShjI5pOGo3tk0h2AB7Uf4Fy7yCmvLoOOHbEkARoqu617tlF8KbRLvFU4ROvHLXrr5Adusjx8ZELv5gDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iG5z4qJ47wGgMxBoS9z7MA1vAnuplQPY1b8Z7zIarYc=;
 b=rJkdX/jm5i4WDPDMJVd+4AwvHmk0K+UATvDGDq3ykgwor10f06+B/blVFrOivM66OhIA1ZRWO55AvBWIMaw7jReoNjRe+ERPL5XTVq8VNnCUIChWkNF3HRrmgbncCXP2z4YYsiSPxW6JY2Aed1yfnVJL2fjl7pzUmuRvOozZLpL/5Vz9qhLkd9eDkrXkJAOiOhXoDpjrBEC/qE6VI4gr5006F6DC0XMBVHjKdTSFuxTu6NIdehHNCHHThYJg6njBhUdRcTJN+gymiLUfpdzqUf6Sybxnds7m8F9/su8FWkQFyKpUQhz+Y01OtNXffZ2PJ7V8kmErs7dVFdHcToTO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG5z4qJ47wGgMxBoS9z7MA1vAnuplQPY1b8Z7zIarYc=;
 b=FmAaMh8aBTDfdW6ky2UcWMfJGbGA9KTrSr3HXFqSlcqW4IU5OXaUiiX2clrU33FeGbEybKerzBZ9XzY8FLPL9LDOIRukFz8t3h572xWl4O4oP07GNM5R9//z0CohBfNMf771VIivl19o5sTOViNFciNu96P13volNgeVlSdRvyY=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by SA2PR10MB4716.namprd10.prod.outlook.com (2603:10b6:806:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 11:20:38 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 11:20:38 +0000
Date: Thu, 15 Jan 2026 11:20:41 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 02/23] vmw_balloon: remove vmballoon_compaction_init()
Message-ID: <7a6d15b1-0273-44ba-95d2-35533320bc09@lucifer.local>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-3-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-3-david@kernel.org>
X-ClientProxiedBy: LO4P123CA0290.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::7) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
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
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|SA2PR10MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a3418f-0886-4557-af32-08de54281c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oP7cxTMe3b4PjTcX6oyGi91nHybiG5XNkAyOGUE+XcusE1i/oVGyz5/fUGd9?=
 =?us-ascii?Q?A9O7x2UN5vx7mf4V6cU8V66uJ6fPBplUsHq70VSQTNCuOoV4Whg0E4gSCGUx?=
 =?us-ascii?Q?rIoGGbkAkCuf/HEZmhjjelnsTBGJNZ0LuSffpL7CIY/hs94lliPaeEO3l3Nz?=
 =?us-ascii?Q?VWYJOOdPx7eb5NTCsJGJce7Tr2RvTKtJoZBRM8RngPYdZnJMOxs7ySrxtrwj?=
 =?us-ascii?Q?vQBusOswyINPAHvq/SzE5Qi6V8tWQoinLvRfvJEw2K2A1k9LtyjBNyRxQ4FR?=
 =?us-ascii?Q?iGGgiqvqtA1J+wDvb9mc82aGNw98agf7spFrPlaLR6BfVOptNaSbBTDU2YAf?=
 =?us-ascii?Q?7xmcrsBI4r297oDJTK+npng+pzvk3/ns/jLz0oHPapzIxfi8c9oc2pay6JVH?=
 =?us-ascii?Q?4uHUg9UfO/RKDs2bwuZ59Zo6qChrANZgrSHrZOnXadpu42JZSHzUvPi4wpCP?=
 =?us-ascii?Q?bshGua2fqvw0Avqb6DpjQh2NWtqn23DVnacktPFUHkQfLwI5hZv91YEGvJtG?=
 =?us-ascii?Q?6EGcwzFO1cmxaV7lpoxN+yIxMiik26NEAfqNpQ1ojgAnYjiTeSGu5XQNbOjm?=
 =?us-ascii?Q?DTLn7Bt1q8TSpOnJYKvUa6sXDgd7MuVevnojxfGvswhi4uTF7vNfXhvBcqd1?=
 =?us-ascii?Q?jXhWKayNvTHxe62R7rgBDutIjL7YlKnF5tS7tsg1rkloJGx5PQpjsWuyhov/?=
 =?us-ascii?Q?y6V82QhmPp85/AP6UXj5+3+YpNla8NRt5EYKQCBZOjr7xLiX94x1FiV/jFeY?=
 =?us-ascii?Q?ErAj9SfMKRPelmsPIlN3U1o3cKEm8PgJWowgyvPw001sYlyn4HeVggqizMkz?=
 =?us-ascii?Q?7QWUzr0+KfqHyEXugBvyAhDrvP0QtTJiAutIdTHhIkw/eY93Zk4py8luO327?=
 =?us-ascii?Q?u1Mk88ZAJydFU7wuNWG7Ifd5E+1LUdrHSNVaARwh9z+KjL+w0utCbO+Qn3Bm?=
 =?us-ascii?Q?z+Dupw/XZEBQd7jcHbhvM+mFplA0B7KIw0sywrbADymyZMK7ZpH7ylt4gApS?=
 =?us-ascii?Q?1kQ6PV56LzSS4WnEMFAA9YYQc1SqftGD+xim3eTO2ogxJlHxfdeoDs7lnaF8?=
 =?us-ascii?Q?W/ugH1XL0lU3LDNyEUdVeCBGxdEB4DkOrvGaYosNdOJ4ElXPAXmazuMShASJ?=
 =?us-ascii?Q?B3m7JoyaFuITEErViwNQbwNSRH26Hd4tF89P9DJuVYVKLa/SaDc/A9Elja3Z?=
 =?us-ascii?Q?qJSd475RCDMQdJAbT36zWwp149R6bxZduYAsSFZusD0bLSnERED80LaXKfhd?=
 =?us-ascii?Q?BXLnldo0f+5nJcefqGHRkvBjL9S8BYl/ov5HXOsN1dypg5l/pcF+qvur86MR?=
 =?us-ascii?Q?SrYvVB0+uaBNQeRmxOaiB3+zb/zTjRudIjTHOqj+91zHaHAH+D8PAtiHw0vK?=
 =?us-ascii?Q?EHUgisvIuW9bAV/IYL1cnde5kfOIyvN+66v2DcD1Gje0wFsu90qWUS3p2Jyj?=
 =?us-ascii?Q?vvrJP+kMHwi1UNYIwHi/jc4RHhfX72VQMVbcRKM3P/I8atfcQZ1tnWwxeVcr?=
 =?us-ascii?Q?Wac11Ym2Vejbg9fzKa4esxJQd57kkvAOqIVwlvZy5cioPB4hudvNzKqDw/mI?=
 =?us-ascii?Q?HqbYK84P2cf3Fr33sY8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u65T0x2+Ui908Pg/tZtIHNNmncHn7Ix6T+xosvvDaUwrZhmiIcPTb/3qrjZU?=
 =?us-ascii?Q?v25n3a+w2yW2jPbXXch44TQjRYPBl4XGTk9HojAsCwWCyJ7YiOAtc6krjrSy?=
 =?us-ascii?Q?iYMMIg4T5B/Tsb//lZkePXdxWYc+Ovooqli+VLHGh7eZfh7s1NMg3I1eOLUH?=
 =?us-ascii?Q?AUwkGikgsP+f1bup3EdhZiAr0AznjVZsVUfFKXUMTc6vsauQoMDvXzOMHJeM?=
 =?us-ascii?Q?T0GYJi1rcNpRKM1nFViO1Py2+SC736XvEbTssbE4BBd2CHTAlPLyJtiZPenp?=
 =?us-ascii?Q?N2nDAUynY1Ax1Bia+TacafcEHfT6SPRMT+FodiUrwo9wIdtWmGqZgdu7g2ON?=
 =?us-ascii?Q?tMllpe9xGLym/c116I4AmY/C752TOenuf48ObV14PvvwULz/jLcZAhIHNLoB?=
 =?us-ascii?Q?/DhbwUF29Jv7Rg87BeZNlq77dbzrWLUQJYnH/Ny9Mvumih7nch/PUwfoR6R9?=
 =?us-ascii?Q?ggAr8iPoNbIteW1gSpVtKhvvMPrp/qEln6EvXCo8pWPyznfw5rR/DqoOM4E2?=
 =?us-ascii?Q?jKg1k+HRujcp033oID1aBBsFONT+n2BARh5T8/eNkMigPVUbr8X+NNklhhMp?=
 =?us-ascii?Q?ceXixEVswGNL4rk10FbUJ5DwGFyM6C4yPKC9om5x228WQC4ul7WqngmSrT/R?=
 =?us-ascii?Q?aK5X87YpU3+67N0HZYL7y/apna7luzGm4SXF3dfLIBQtXYaeM1F0fv3bN1dE?=
 =?us-ascii?Q?oTr2Kt78iiqMRbmOJBqUJX3Sy0WFFbmC5h1zhWfK5fzLD9vFbxV3ZpEf6zdM?=
 =?us-ascii?Q?rWHrP4tWVAp7UMOeEmy7x0ch1qSyGXxzJVMYdp18f61W5uX3lloQo08bCyWu?=
 =?us-ascii?Q?kJEabI+JSe5Bn/b1EBF6vN/vBStmmzwtrls3LRNoCkx8aCJRHct5I4j4FQUR?=
 =?us-ascii?Q?5G9Z8z+esjYsA58W61tub6iLiKKHEMA0TYAI1yNR1M4PAgEgKujMNj+h+xld?=
 =?us-ascii?Q?dTcpR3U1A/R5dttOZMhAnut0u4+rBlYsgIE+CtT3yv/fRUPYHL25X1fHk8dc?=
 =?us-ascii?Q?70QcqnylH23w3AzYCl8chOjgLrSRi9tKqgejCUUaoteu1vALSA3cr1JjTWJh?=
 =?us-ascii?Q?HzBKqxYUfmSIOXIbiiUNNq8kBJ8Le7+B6qcC7a7q22YN0LQ04jJq4P//iig0?=
 =?us-ascii?Q?mJ2E35wuaARnQ42cT+rzOrgoadLRCDN/tZNjYz62AzMuLeiqNImlG7wYpQZu?=
 =?us-ascii?Q?Bg53az4XH8gnsMB0xM7OrHRc8rHtmnsDJ4trRBQD9wZhypBsF1dFHpuws0xf?=
 =?us-ascii?Q?1XbTLnjBEpeMa50Vay+dEYy8qV7bcmUHH0Eqzop19TWJgf/lJOJL1vEdznlZ?=
 =?us-ascii?Q?OpSi8YIN8t6S19QsWlOVrNK7TQVJYVegir+pRo7dTKSM2K41EjXw5gijO9mC?=
 =?us-ascii?Q?yuqmB7qQdpZnRJnrEdZE6jaMlN7Zt9boPrv6NrjHsrC+1IJgOTHvsCYNUZIh?=
 =?us-ascii?Q?nZ3sxa3y9JnNZrb96v8KwzfdrgNOFfeO4UX0CPFLBggpvYMOPYoxwle90zxl?=
 =?us-ascii?Q?2cLbcEHyZSbHBw3yjTpBFZutYlN5/yHhjnkHL9/kCCbIUTAjoRk35mmuS4uj?=
 =?us-ascii?Q?XpcF3y2+TUTEDlT7EYWbFTCq5oYWr/Ft6j9zK7gL6dR1dF8WyEukivR1g7Cd?=
 =?us-ascii?Q?u7jKQp7kg3B2TiAYKW4bZOQBPvXwyK1bZtwRX0/jB5HDYlbz3OQST5XcbILz?=
 =?us-ascii?Q?4njsUoxz+vr3YwCSCnSl/NS6Jd6JdBLiGcqCikdNQI5G+oPvNfmtc6YZexwr?=
 =?us-ascii?Q?6qZ/x5YqNUKppSztPazc3BMEN6CQvjw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IGpdAkpXCif3sMiYcYqWLxM8B06rfReYeXF8lip35A/qnzOODBdXHWFmICyj0+SYa4LIVmASEcc4EQ3sgR2mFN0BxjWolpW8qeL+FN2n2rIJjB2d87xEtxhqp5PySRNESwsyMK+vNlafLOt4UaU7vY26mS1jdvBFWXE9tZUz+PE8GEhzL9UM54Z6b8XFn6XuZDxUyS/ZQa00wY02KLHKPqtn2XRyNq7Cuae1mikMfnO0fyCJGM/iF2q4I64m2ECn0NDo0Ob8EZQgCESgYGhSNZ5fcoHRovjnmEaFHSKDjg4lPTuPiQYrgoIgiBGq+AInLUDgBGiagoJOT7mz2PUb1ZfboScoBoOWm8CkP3B8viNhin+SaqJKE8Z17pHxPjoJ43/Ipfofp7ZPB6lFAq/qzv6VSU1OLhnP+NPaqfZd8D/IBL7zfHbhrtDZKIv04WzUYciXcP9nOSHImWcPOuVVt25+UxkliDiFFBzasnIjKFmS9FKfmFgbz+4LlCmy5POa+lKwUcnSxq3XKvdeDR8DtMU9epG5kYVLM14NatonB4O7zreBTZQLij/1GLOdE/gqIp++UEEjz7/37xE9M5RjwKbV8ZjzLh9ul1whY7Lrlo0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a3418f-0886-4557-af32-08de54281c8d
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 11:20:38.8714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3u6CIZPnEvuXeeYkAU76KnqkxcD0CFEpuF1HZcaCUe/yOq08E1rT46bcwkWD4LBtTgAlKw8F3NrQEt/kRwOtZXYhJ1XTV07EyKdEG7sxi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4716
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601150082
X-Proofpoint-GUID: LXW2sJtsX1JC-sy_-N52WgocRYdqNdey
X-Proofpoint-ORIG-GUID: LXW2sJtsX1JC-sy_-N52WgocRYdqNdey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA4MyBTYWx0ZWRfX7Dh/39vxU1eo
 J3IDonP4y0kTXcAMQLWQvDI1h3crtBBZ4uikGLfikdxuSsCCi142L0lgBxQrp2UcxR2vg4H26cT
 Jn8I99Ov5kUzDbaZe+5c1c/C1QaXUDhCqmldb/k7B3P+G5gqADPo9wiOl2XgN7yTRSPdxGXfcro
 PLk7zojMQDmWn+AV1uEkcqAPAlo5rYBv2/1evS5Oz5kaceh2EbW224Uf4czZRMvgyvTnR+pe2Od
 UuQgLEEjk2r6wx9Tt6TKbg/r9ntmm2CFR+2nyc7Q5GkGOuzDMhgDwWb1JB/18/+A9ZSt26dXmcf
 hZvujHfkELszBWZf7GHKj8zhWDg7jzEtEHOfV8UD6tKV9cQ6hh3uwKWdefMsViYxhqextheFQia
 0AiIOsP1n6P13rwxF19JGsESSUBk9Etn+WSXxHmfBXjUvHsxQeO5s8Fey8A5ehfseZdahPXUfrJ
 pljbevjsfqhTB6i7z5A==
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=6968cd8b b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=ZutnN-bx-cp8jyhSmMkA:9 a=CjuIK1q_8ugA:10
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:19:52AM +0100, David Hildenbrand (Red Hat) wrote:
> Now that there is not a lot of logic left, let's just inline setting up
> the migration function and drop all these excessive comments that are
> not really required (or true) anymore.
>
> To avoid #ifdef in the caller we can instead use IS_ENABLED() and make
> the compiler happy by only providing the function declaration.
>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

Seems reasonable to me, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  drivers/misc/vmw_balloon.c | 30 +++++-------------------------
>  1 file changed, 5 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
> index 2cc34c4968fac..07e60a4b846aa 100644
> --- a/drivers/misc/vmw_balloon.c
> +++ b/drivers/misc/vmw_balloon.c
> @@ -1833,27 +1833,10 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
>  	up_read(&b->conf_sem);
>  	return ret;
>  }
> -
> -/**
> - * vmballoon_compaction_init() - initialized compaction for the balloon.
> - *
> - * @b: pointer to the balloon.
> - *
> - * If during the initialization a failure occurred, this function does not
> - * perform cleanup. The caller must call vmballoon_compaction_deinit() in this
> - * case.
> - *
> - * Return: zero on success or error code on failure.
> - */
> -static __init void vmballoon_compaction_init(struct vmballoon *b)
> -{
> -	b->b_dev_info.migratepage = vmballoon_migratepage;
> -}
> -
>  #else /* CONFIG_BALLOON_COMPACTION */
> -static inline void vmballoon_compaction_init(struct vmballoon *b)
> -{
> -}
> +int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
> +			  struct page *newpage, struct page *page,
> +			  enum migrate_mode mode);
>  #endif /* CONFIG_BALLOON_COMPACTION */
>
>  static int __init vmballoon_init(void)
> @@ -1873,12 +1856,9 @@ static int __init vmballoon_init(void)
>  	if (error)
>  		return error;
>
> -	/*
> -	 * Initialization of compaction must be done after the call to
> -	 * balloon_devinfo_init() .
> -	 */
>  	balloon_devinfo_init(&balloon.b_dev_info);
> -	vmballoon_compaction_init(&balloon);
> +	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> +		balloon.b_dev_info.migratepage = vmballoon_migratepage;
>
>  	INIT_LIST_HEAD(&balloon.huge_pages);
>  	spin_lock_init(&balloon.comm_lock);
> --
> 2.52.0
>

