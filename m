Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD02EB902
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 05:47:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9cKQ5DtczDqZS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jan 2021 15:47:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=martin.petersen@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=MbsoL5ne; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=dRtnMlZU; dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9cHB4t4wzDqXL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jan 2021 15:45:03 +1100 (AEDT)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1064is2a137013;
 Wed, 6 Jan 2021 04:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=60HBqjPUA06EEirgsW5W4vJWbdWSvnl2yblUaxfFlzM=;
 b=MbsoL5ne4SSnck28U+H9kqf6c0cyVpx1B5DnarzNSyHpEjzsp6JoBX31ioiLa66+jepW
 MbETLDOMmiOwKG/DLMX3JR84ofONJgyXfmW3itGZTmjwPtV5mHcjOyQFPAOFeRPqwbrI
 rTRIas+iFHdiWtaA1+TAjNxssaqkk1hZ38TGwgfh2fTl4yql/lPsijQdPm5sSisvQWj6
 Vb/Bq1ZDzb4mX7wj1Qz0O24SZ5Whx4EY7gjxqsj4KgPao0l7Tnxg/1iHP59d8mmXlnTu
 zSM4/gX2zjPehxkr90tgrwtp6gUf//rOM8H68KJhhcfPoVxitUeGWd9th0aWsyY5bnd7 mw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35w542050t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 04:44:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1064gfZU022470;
 Wed, 6 Jan 2021 04:42:52 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by userp3030.oracle.com with ESMTP id 35w3g0dyrw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 04:42:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nL4UVfafT2yyCrP53pW2/s7MbVYuQxKoRsfdcMjU02QJXzPOfBIc92GyOn1B1iJ0HZVWCImbG9BV8NcmnKp2A1Wrg4gh0u4KHPDEiT5Xv+YNgQg1yPWkF5+aGPPY5+yT4jGlMe1D4JahIAieLgN1fBW8UW2nZT/qGRSmSFd9cLC8Z5ypmZeXArYCdzaZBmjVFHf6vmJbQ2/C/im2aV5ogE1LwHTgHZNtkv+3JTY7LHJXVL11JLEwHDsHDh6gnMO0PAG0c6Td7ND1666QPQqWwSy3M61tVJfv9vXgk1nkHbnTPgUCAtcXQUI818F+2P3EnNFxbmtW595G3gCpJh6/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60HBqjPUA06EEirgsW5W4vJWbdWSvnl2yblUaxfFlzM=;
 b=HpJ07xMvpjWg2KQ6wSyANUW4YuqOBqexPA/5v/pFzugfV1izsk+WDMqQQ3mBATGshoGkviLWUsgXlFmXvFt8xk8iOMWXLKlrpnxxOIx+sE+eIjRDbczm7fvqjkyiOsiINZ2onXEOIN2Nu0QDLvCFK07EMPqCvj1NPsrAMyJgspzIPqnZr1/1WhBrB27DmBifyBHguxDc7Y9Hm/cVfL4Kgnc0SsmRsgN4cehCJ3kRm3osIuAEBU6ZCP9owAzauAd1kMHl9LVN4f8EE8E74nd3yCF2xDltR/Y0BIJ8fRwgshXJ4kHBPP8+wBcv2OWCPVRZYnXvrpCZmAYrFi3IbO1VBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60HBqjPUA06EEirgsW5W4vJWbdWSvnl2yblUaxfFlzM=;
 b=dRtnMlZUjFS6v9VnLZiZpJUjfTUSxvty+RY9s9/4xgJsFoGQ13wGElqSAmgw1t4j+ImZU1zsLgxb/y7np9hzdWwSm/q+VcmjK0807zuA7P6Ig/OFjPxD+ixi99VEg3Wn3u4gIoEwSv38adQvBpYKqbNE/zu/kOotezzeIDeKZXo=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4438.namprd10.prod.outlook.com (2603:10b6:510:36::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 6 Jan
 2021 04:42:48 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::54f3:a8aa:a2cd:a3a4]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::54f3:a8aa:a2cd:a3a4%5]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 04:42:48 +0000
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH v2 4/5] ibmvfc: complete commands outside the host/queue
 lock
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1v9caekxl.fsf@ca-mkp.ca.oracle.com>
References: <20201218231916.279833-5-tyreld@linux.ibm.com>
 <20210104222422.981457-1-tyreld@linux.ibm.com>
Date: Tue, 05 Jan 2021 23:42:46 -0500
In-Reply-To: <20210104222422.981457-1-tyreld@linux.ibm.com> (Tyrel Datwyler's
 message of "Mon, 4 Jan 2021 16:24:22 -0600")
Content-Type: text/plain
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: SJ0PR13CA0219.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::14) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by
 SJ0PR13CA0219.namprd13.prod.outlook.com (2603:10b6:a03:2c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend
 Transport; Wed, 6 Jan 2021 04:42:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75c0d038-bd96-4ede-c994-08d8b1fd84b1
X-MS-TrafficTypeDiagnostic: PH0PR10MB4438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4438C7892111E6C903FC47018ED00@PH0PR10MB4438.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dnzBCC3di4oRNwB/Ik2o1LZC0qO/lSv18mgA2RkOxMHa1LwXo2tqmhmLp2k75nyxZQGX/qJRtfsttHe1sHigh+nmsde4adofU79HSQX3cLmoOeqgdYLzeoOKgOcYtVuMTHYUp11V02z2mg2fiEqtqP69VzIHj8rL9KN2V6dvCD/FzmQMPs4slEKXdBCnl1YEsjKbkcf8ed1CHlnhpw3eF2dEo3d3glbps4yB+J5Z5gxPe86+VBQ0cSNd9OpDAxGFcGunFuya02+35Xd51UrfaASfC6Q4jkNWW9jdBJ6P4987viWAXl0vYXX7OG190fb1bJN9bYBHXpLhqzbdCc24oJogZQYd7JFCG/bkWRPHinXlLTIYwdRozzpvV/BjslqnK70gnG4hSpHPcNf87pzidg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39830400003)(346002)(366004)(136003)(376002)(86362001)(66946007)(55016002)(6916009)(5660300002)(956004)(66476007)(66556008)(26005)(186003)(4326008)(16526019)(8676002)(52116002)(36916002)(2906002)(7696005)(316002)(83380400001)(478600001)(4744005)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Es2WLdqvOb/cwA/1wg55XrlsSFQ18p7gCUmC81uty23h4SDL4arrvjSsf70K?=
 =?us-ascii?Q?aqrtRcO7c0uoU121b1xOSXZO9IyKA2zAt2ILQCdbpteS5b+sg1PwfhoRuFlX?=
 =?us-ascii?Q?draoHCYlcHJQCj5tJ7kUvy7/DemYt4XSvSzxxqPV2Afmdzmgu+fMVu7tF8O7?=
 =?us-ascii?Q?uqdosHUfnaxydAkVpCs4b47jI8HSzyX1+O+04AR3fBWGvkUt+NrfPniDzNbb?=
 =?us-ascii?Q?jrzlTodKxTyu/0BJkjElSf0tulD3vZGHyCYSe0JLL36o/ZI4ST2gmUaaYDPu?=
 =?us-ascii?Q?E2WsbcQd7YPlpX2pmdoD6BpImSlhYJ3dKaKI9ftG6cPVMMlY1C81Pq+s3+0T?=
 =?us-ascii?Q?+/3WNIR6rZbo5UvAk3xi4sjnVwhym7yNjncYI2aw4U6dV8PUJhFUBB+eZqey?=
 =?us-ascii?Q?+PEroUDzNd9879/vlHXv6rUKX/2/1hK/+YMl6nOf7QT28+ODty+Mcb7hT2C1?=
 =?us-ascii?Q?S4pZWrm3OZG2e2IytPxw02CLddI61hiNhxpLmqib04R02OcYlDoae+1xsp0D?=
 =?us-ascii?Q?tW18lZIeyIyCPvehaZxg7LSwAolg3aiApwc6lmsaDAcajXlN54M7k6RywjQA?=
 =?us-ascii?Q?LmeSoGDn9oNzGkAuhCSZSgCigXqCYM7A1AoAl91MR4NpgRZC0lSVCWeKGrrY?=
 =?us-ascii?Q?BeBw4NXZfZJ8ikIh4yxNKaZ1uj21qARNnU81Y6tDW+S+dZB6mCQbQv6c4puW?=
 =?us-ascii?Q?kJ2gPRNJv84RxEue53pKmMSWD+gu3DRUNDphNUqW+HDjIikioYKQU4E9ewuC?=
 =?us-ascii?Q?q4O7ZwT6az2VaVYVDEimeeQehsFhvgUoKhhQ/cZW8zZ/H9qnaXllbMyVUL24?=
 =?us-ascii?Q?GGLB8qtdwH270F47mcuhhxf8GyBvywEJe+vfJXYF5a6vVDzYFyTVRdgr0jcI?=
 =?us-ascii?Q?8LxJMAamMsokZEUvhth5FPxgA80txufHjS/jU2FUY+Rd0mIiurKX/VkQYKkg?=
 =?us-ascii?Q?y4HB1VdH4hvcqANN1qBurGeeOu0T+QT1sMsTyV6AyRM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 04:42:48.2985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c0d038-bd96-4ede-c994-08d8b1fd84b1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4Agh16uzVf/Wpcgs8Ok5j4fbvu/eGFyb7Uniuzz8s/mL1EyVenFL8mW0pHDv5SYRG7vyI8EJyk30uS7GsuSjr1hZeOS9y13Z/pr1bO3kHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4438
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060027
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060028
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, james.bottomley@hansenpartnership.com,
 Brian King <brking@linux.vnet.ibm.com>, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Tyrel,

> Drain the command queue and place all commands on a completion list.
> Perform command completion on that list outside the host/queue locks.
> Further, move purged command compeletions outside the host_lock as well.

Please resubmit entire series instead of amending individual patches.

thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
