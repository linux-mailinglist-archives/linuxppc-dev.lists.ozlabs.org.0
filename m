Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AF72FDF86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 03:44:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLmvF66PPzDqdm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 13:44:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=qIh6bBgt; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=Pc1OObw7; dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLmsM4N6lzDqmh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 13:43:03 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L2ed1J102657;
 Thu, 21 Jan 2021 02:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=xVgpPLJNySqYt++QN6oVAmiAyiNzApO85Dty3H78gfA=;
 b=qIh6bBgt4yvb4I92vvqLtyFTNVYVn9TDYE5zT1OeGS9arb+IPeeq0Y7ulK5t2rC9TfRX
 3FZqZX0vr46HazsaXq/8fYA5SIthU9CEdyImiNc2cwea2RBVIvs9QRGEpbDqMI3wyIpi
 SZCRieExS4SrYAazcJTx8CsAcXCNjGqxUfurEDDnjKaHMBwQqgMXznVQ8HoKAPttL2x2
 vTaqzaItsct46eEDC3lCpFrxpJm3UJasm0T/a+vVxNlEvWGKy03n5OditqnQ/m2yc9o6
 q+GePJLvXvVpVbcz49/J9GcgGYeHFQAZp5U6fe8Vazl789s36QWNeCmyiiIqtP5DbhoG vA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 3668qmw9ff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 02:42:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L2YjcX021386;
 Thu, 21 Jan 2021 02:42:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by userp3020.oracle.com with ESMTP id 3668qxb2hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 02:42:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTU4ZIwi18PzI0SR+xQ07I61pS398JsecUCgugO+7NXlDAALDLyXf5Y8GCg4PjHXtC0zvTulpTJns969dyRwULlUM6rBInkNMCKAmjc9eWkplw+vX5jDx3gNTnx3zFn3k+kidYrZCEhiEOZBn0l+Hattb9V5HkqLCjudR6GCiimg7TJ+gOz5L+4aYeFeNHdDjdNL+4IDQH2hZKMb55lB0BzPyqO6CstlILpadPIhn9Y7A0fMfYu3BCmJhUikptG6usnVTnLkNaIi3NlmyEjty8jhltCU5iCQlNKMmETTxYACXybBj6D7COSpXhwgvl7lca/hciOx8Z/YXS9mpnzcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVgpPLJNySqYt++QN6oVAmiAyiNzApO85Dty3H78gfA=;
 b=od7MSCz4U3e2FW2BosHMY+pMuVMzgP69/xnB7hifZ0Wrg08n7dJNzBrSXqhFCC4yT9EIvXHnkMRnuVFCHctvq3/E14XOu54blwulQlYSyzEvjuTI5ktzapBRfIi7UOpZZLODshRYai1gFG3I06iSRI/LHYcyNgSKn0HZE3Aa61eJa0Qs1DX5fwvC8iUUqxUcDPeTfAcWkBpA3zoy2f4dZqqYteLFcrr2IqURGdm7q+6su/X8eFLcOhfdIcVVI1XusBx11Y6KVjtqRJl7z+6SYUsw84Qoy2vIkw/9N+CUvCHyX/+Z/mIS1puPgVXa47Cu8XCaBrMl9puWP+UR+lA8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVgpPLJNySqYt++QN6oVAmiAyiNzApO85Dty3H78gfA=;
 b=Pc1OObw7ZbQO5sGxZimV4I2AOh4sDkHPR7z1+F+bjM4CBpRPThjfdAbGwWOiEb4ByOHZ7gW78TFkuIO2zC910foedfF8RmNe0sdtvq2FAm260aBQqHDNcRv4z7e8ooITKxHYbWqVECEZPp+HUyqt9YLXtqhJfVL6pW5s7IxN6GA=
Authentication-Results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4662.namprd10.prod.outlook.com (2603:10b6:510:38::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 21 Jan
 2021 02:42:45 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::54f3:a8aa:a2cd:a3a4]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::54f3:a8aa:a2cd:a3a4%5]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 02:42:45 +0000
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] scsi: ibmvfc: Fix spelling mistake "succeded" ->
 "succeeded"
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1mtx3ggdh.fsf@ca-mkp.ca.oracle.com>
References: <20210118111346.70798-1-colin.king@canonical.com>
Date: Wed, 20 Jan 2021 21:42:41 -0500
In-Reply-To: <20210118111346.70798-1-colin.king@canonical.com> (Colin King's
 message of "Mon, 18 Jan 2021 11:13:46 +0000")
Content-Type: text/plain
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: CH2PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:610:4c::16) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by
 CH2PR10CA0006.namprd10.prod.outlook.com (2603:10b6:610:4c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 02:42:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df2b0f00-a8b0-4939-915c-08d8bdb63b9b
X-MS-TrafficTypeDiagnostic: PH0PR10MB4662:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB466281568B975BFC67418EEF8EA10@PH0PR10MB4662.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mm+jGGi9hZb8DsR6mwzj5v1DhzBFIm62LzRIKNF9/pZG7LymceQRMCOeOygkJgCdSCcM34i6AP6UHn+xINlnO1MTk9xZk8KK6D4n0zpMihCCTu6f/+lKzl28wGAOo+VuMTN/oIsKF3UA6Jx9oxfB8tGpO6p0AlLIf9042hfAl5bLL1tKbbMH+fglkvnQR8QRprrx9n0TUYTYBezPRNf46DqApEIZIdQg21PNJcjnJuvX+PIFq8c/RNz7wJw97xDUGmSnX+e2dCxNB8LYYm7xRxUBqphzYWA9DuWWkWNxCWLXayVi+JeHrxGvWHtDw0sUO7fS58asmSon1UE+CLyweV/Vz4h7aaNW0Y3uEyoynfu7dJY4QVGJiu4w6OAU1KSBv7FkYpZymNRN+5CmKwDLZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(39860400002)(366004)(136003)(558084003)(316002)(8936002)(2906002)(8676002)(36916002)(54906003)(66946007)(5660300002)(86362001)(7696005)(6916009)(508600001)(55016002)(186003)(16526019)(6666004)(26005)(83380400001)(7416002)(4326008)(52116002)(66476007)(66556008)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7a0DgFuUR7DufIW2W6EfdiJmAlDRuOA1PnSscs5sCKpq7j+Ih4F8TxUSZns6?=
 =?us-ascii?Q?KqzqQavD4Yj8jIF0uFd2Fm4dR0oVFdjjOfOiQ0xoLfBFXlQF2WgZVAJbqPPg?=
 =?us-ascii?Q?KkzSP4sqjmL+Q5MT7tC5mzLv6dLmMkoMHT+zoyIzbmKCdAsD78jtVn0FwshQ?=
 =?us-ascii?Q?67vHVM2EIJb4FRjbZlXoPY7aZrZsjNq9s18JhHwSC6RPcaYaXfAlGpc3/vDy?=
 =?us-ascii?Q?d9Mp9Q7GiflDFq74ZibvdmfpFhMnSk5czSM4TXKbGryZGcLQZS2660kiqpc3?=
 =?us-ascii?Q?pm0Yqj8GubcWIyerpdBnr38sEq0LzVTYxMFq9OUPTZ2qHNuniHhgX6SE/qt5?=
 =?us-ascii?Q?jGK1ZQPh2auvQzTHFVDRbaeL25+NPY+qffqH3N6JVhGq6hfFk74BnPu2/MIq?=
 =?us-ascii?Q?/sF48EsKj6EJTnQbtEZesjLsV3+bjt4rxxNVnd2hG2cGArVOXgUD6FDX/uGZ?=
 =?us-ascii?Q?/YrgbtqL4i4wTo1hLmKUpKL1QdWP08ZPTr32yaFkduzv+CvUyEwNdpDSXmXZ?=
 =?us-ascii?Q?u5hmtC57vlAnr10ynEBrvBVr1mbiwAFzX0oNDiUu1jO+Ly8qUDD4Lew2bdHF?=
 =?us-ascii?Q?ekNldcs1DdX+T7vZKUEfsppdlT6FLCG6JpbDlIGWaXp4MRlVaRMWUcUpEhwm?=
 =?us-ascii?Q?ZkhuOEOWpj2zg+OlgsPfVn8Wn8muzLYeCRRLchmiswUnCiCc1xY+6k5iLET7?=
 =?us-ascii?Q?BumoJ8HdzlnD8mOQHmtKZ1QFdwuD8aGsTc3rOhFia6QdQuRF9XEOFerpNtgd?=
 =?us-ascii?Q?TrTy08Ti6TeVwMOfjhgsdv3N6TMeVRrJQAUYN1Anp6UHAd7nG5wmhUg4Emr+?=
 =?us-ascii?Q?cCnJoviAdShiQ6TJj05j3cAxenCOAMFJBapqqduNQ4+qKlpnEKZ+4tzf92pO?=
 =?us-ascii?Q?LiNUJCol1Gv3ocNxnoKmT+poVtWedtFMNX8TtQ0oPn790LYzFq0jcesEq5Qv?=
 =?us-ascii?Q?Jxzeo/w12AhVH4RsgfyOTg+ADMrZ2L2DutDmbv3E+4T12cA5Ynjx/Vcwr2Le?=
 =?us-ascii?Q?qyOx?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df2b0f00-a8b0-4939-915c-08d8bdb63b9b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 02:42:45.5609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRJ/TDeZ2ua30ACfY7sfJlJlkUPg9ITsNdLhhVfTqX63d07udmQu7o94Tl3z8u8YTLKL0szxQBsN4Gi6w+JIt6YA1AZtPL10aA3TXRn/XhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4662
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210010
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210010
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Colin,

> There is a spelling mistake in a ibmvfc_dbg debug message. Fix it.

Applied to 5.12/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
