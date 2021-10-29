Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E564404E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 23:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgwVG127Cz3cBs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 08:26:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256 header.s=sel1 header.b=jShKze3P;
	dkim=pass (1024-bit key; unprotected) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256 header.s=selector1 header.b=Tw6SXSMS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=selinc.com (client-ip=148.163.143.141;
 helo=mx0b-000e8d01.pphosted.com;
 envelope-from=prvs=9936515456=eugene_bordenkircher@selinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256
 header.s=sel1 header.b=jShKze3P; 
 dkim=pass (1024-bit key;
 unprotected) header.d=selinc.com header.i=@selinc.com header.a=rsa-sha256
 header.s=selector1 header.b=Tw6SXSMS; 
 dkim-atps=neutral
Received: from mx0b-000e8d01.pphosted.com (mx0b-000e8d01.pphosted.com
 [148.163.143.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgqLV3xXYz2yYv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 04:34:41 +1100 (AEDT)
Received: from pps.filterd (m0136175.ppops.net [127.0.0.1])
 by mx0b-000e8d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TF0egH018353; 
 Fri, 29 Oct 2021 10:14:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=sel1; bh=IIrdhupVQbPGGhldn49CE8ur1Cl+KQs+soZdKsXlDzI=;
 b=jShKze3PZAObeG+um9zWKLoJub8Ke3ue822V9ovpbLC+yA7NRywtU6QxzRwkIN5/obf5
 Q0EAZiA8biuYHC1H9WLImUfKCapuqMDv+wH/x8LYIhg8U7r85p1SzUxAA2LNyRzy/Blf
 mA59Bjb25UrKbDyHRONhBrMDMGMFVmsVxc8k8FrDVvTMmaWd/xEtZB/l0fZ+9kF3l27T
 l3c6BJemTIoRwQXAos6Js+1elHVsF0GUES2gf936o4O9/OM+9ixH6Ihz1w+lBA4NW2xe
 vPFnVCA3NR6LcNLIopd09EsVghYecE7Jr0vYRq9SAG5g5I/CCo2JCIUI9BHEiu1Hwhy8 9w== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=Eugene_Bordenkircher@selinc.com
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0b-000e8d01.pphosted.com with ESMTP id 3c0at60bym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 10:14:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gywrerbDCG0OgB3bKSMU8tRxR73rEizpiUDWHT8C9Wy/7kywEGEmeQBD7DAW1rMUrHZI81NZhOMPALORC7M/oIA62IRK0t3zlWTA3DPHnhBaubCoomrHiVpNEgAzLLlotSUQ+3yHRVhOs8ARl1idG8RbyspY1uOgLbPICrViueXNnAhUeC2uFvY0/tzhEKWNCMqAGSdyMaMJcilNa2Cv52OvagLArwqxXtjpIg1m7NN+j5UxAGpo2wAm+ZHukt3Pj/aiYAYD13PH5gtgczK6f+49QKjpU0rfpUvvcanusylkO+9m0KyaUaUtSdnjKZoQfT1U806iLcEB91vvQ/TjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIrdhupVQbPGGhldn49CE8ur1Cl+KQs+soZdKsXlDzI=;
 b=PA2q/bdTFCJF0m/dUFt7t/g3Vx+MY73tKcO0gJGfcF3MMzkh75D7TkAWtQh6BuZFoJIgX86D58ZIDgDg4gwf8UXLEiBaJIVLZrWl5ZEFa4tJAcQKJuF4Dk33ua5Jzvc8sTVT71Eylx3M08U7gKElFuQiOpoAyEP6ILNQSbpGtgFBb8kkVr5pbfIaJYQRTvPPotZyFb/8oCm6h0zpYgOY8JKp6iki3EDBOUqdS9qdRBc6lJqwO8P3H4aZwW7eZ60mWtqGib9DaSiEwse+0T+I3P4HWEOZg37ERvHnPgvoh3niX985DAJujw3+A2KijJDM4DkFCTi8Csla5YJ9TjJMjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=selinc.com; dmarc=pass action=none header.from=selinc.com;
 dkim=pass header.d=selinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=selinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIrdhupVQbPGGhldn49CE8ur1Cl+KQs+soZdKsXlDzI=;
 b=Tw6SXSMSJZnp08HsVQL5Dqq5bgDIOLo9Bs/8cOu2LWstlPmYPfVbvs79KsOh+6/iZy6xBRiGjCjNkc8B7r1o/eP1c8tvN458llU+GthFMNw7kn1Z02psqlUguWcUxrBaz+5SudkuxCGsNEi/pJGRcztHHMUqTOtTuSqNC8zOBVU=
Received: from MWHPR2201MB1520.namprd22.prod.outlook.com
 (2603:10b6:301:34::25) by MWHPR22MB0255.namprd22.prod.outlook.com
 (2603:10b6:300:60::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 17:14:03 +0000
Received: from MWHPR2201MB1520.namprd22.prod.outlook.com
 ([fe80::bdb4:45a6:34cf:fb27]) by MWHPR2201MB1520.namprd22.prod.outlook.com
 ([fe80::bdb4:45a6:34cf:fb27%7]) with mapi id 15.20.4628.018; Fri, 29 Oct 2021
 17:14:03 +0000
From: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azgg==
Date: Fri, 29 Oct 2021 17:14:03 +0000
Message-ID: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=selinc.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c0be644-beda-4599-0104-08d99aff81ab
x-ms-traffictypediagnostic: MWHPR22MB0255:
x-microsoft-antispam-prvs: <MWHPR22MB0255689A236DECE077312E7E91879@MWHPR22MB0255.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ODGapRXprJtpwzIgT57PPeKWNvEFeLaoaJlf8HGDUo16KrDeoZ67j3NrYWQOdewsETtPCfsXmpx4QQDAEG/jkWQ2KMZsNKD00KzrLOc98A5/cDF3LDzWFDmaMkJg+9KW4q/SrHmCWhmfhASD0yFCWXBUmSObQtB4CNe49y1RJ7olCoJ4taSuuQcE9eTlZfOlSmB4GsH/c+VoeNMGKrKWF7F+/3R0F3NL34UMA3tNsmYzVvNCDM0R3NjYj7TsxQt+ZbPf7JML4BkQvWyRWxHra6kXyOqD+sLJB+x/etSDeUfyddZ479i7m7WUgV8myyJBdMbHQ9ToEos6hbG9skJHR9Aj2htdkSNu5Db/DS7A1q+C19a8Ceo/VWsVq7/Ejv743ppKe8hFc0qDnmZs9Gn9fRRaY5WrnxcUhRGHUapYSULvCdmpbNz6ETAHC+WAdlaGD2t8F05PtFN37LqMvnnNiTZ1z04OVw/M9wb4Bu0rM0II5ST91IOi4tM1hMgSYcg4cSQpDD9FE3Mp4VcpvIxTgy3AmmAwTgn5ncvEEnmDP/Qt18GmH06qXjauSRCebMoc+HsI1kAO2xu6uMuO1Pgq6ZAmSbGyGjzKjOLDu5dteegnJZlgxziroPYhK2212xyNPVc+NJQPgapGo18JYhLDvSA4IiDoqWWHQDSbGJzqb0vodasMK21NjMJRAbhXwokmAQCheWkWjPoNQnp52MEOoQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR2201MB1520.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(71200400001)(83380400001)(4326008)(54906003)(110136005)(8936002)(86362001)(76116006)(66446008)(5660300002)(122000001)(38100700002)(52536014)(66476007)(66556008)(316002)(66946007)(64756008)(33656002)(7696005)(38070700005)(2906002)(9686003)(8676002)(26005)(55016002)(508600001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KJKILmwwfbW4e30hz+7rSWLaDImFrRVJztjimJCer8GUcerwsOZ4MS0hzw13?=
 =?us-ascii?Q?Ow8cGGGT8sr7JDg4mCVYrOh4zpoxOw+qcH+6Fb4FFT1U32wkbrQhyTyBpGvi?=
 =?us-ascii?Q?X27TKGudPfVAlaVnxR227C1Vrw/xBCSpoUejGxWNNjI6LNasfFsJhTGDXK6Q?=
 =?us-ascii?Q?WTOi7dPKt/+fbpSlY4/w5DoTT9gASdTJmOu9BQdZzgUAitgdP51YLG2sRhYT?=
 =?us-ascii?Q?L3MqFtBrbH4D+1/sz6E45mMNuVxEVnQa441/SSZKFyRtoU+iVIKdix+Q6zM6?=
 =?us-ascii?Q?yAJBIqYhsRBRBG5mGFwpYzWdNTEuqwtxc0Cn8Ceenp1CtLeeoGfaMIWzEMtZ?=
 =?us-ascii?Q?wtGFVO47t/1K8JCJLW/DyCeWy6c2TDYVURPaDTaQHS+pDVS6NSKa3Wnw2xxt?=
 =?us-ascii?Q?sfkBowllaV3pfvl4IYqTHA8KaU4pD5kdOp7J4Nq2Qi0QIapX4EsYrq86G/zk?=
 =?us-ascii?Q?71QYn7aAoQCEVU84cfRIbTDXodpGUNbkdEOkKWiPrNNeFVC6y9fTHR4YV1HK?=
 =?us-ascii?Q?8bAwg+6UfYrQsxnrFuKXbhgBTBfHldlXNSTEKkqowoyu/au+04RNL41mQCCi?=
 =?us-ascii?Q?Ls89mYegEyhduGvm1YcQZaAcxfKqBSHIGO5nclO38EAH0UxXNRB2RamKeFSl?=
 =?us-ascii?Q?1fS3CZkdQI0IZNWsWS2NfQnjb0e9gNUWXU8gSLEwwtgFfRbKN1d7atXgIGjy?=
 =?us-ascii?Q?SI1koe9KNvmtABr9ctRPACyLTeN6rq43MUHt4kUrBv5IqiaRsSbfkmoDd57e?=
 =?us-ascii?Q?DGzYo5vvzMWZNR6ez8+AxwDyjhaYRrv7FdkKXV17qJiRFRdCnBe8ptlgC22s?=
 =?us-ascii?Q?ifhbDiMab8q0EPWakNcMr6w1KdcnoteWrl/B4qi8IgRN4UeMcVgiVeC/0p0e?=
 =?us-ascii?Q?zG45sWa1TUstZYc+gDNYlNRgq9KuJvXDm2Rtmn7YVHm7W0Idt/AU59rcClGw?=
 =?us-ascii?Q?Il6yelSaIQZQz3EKhOUtz9/TKCkPgW7QEnqf/WyRXCe64WQxlnTEKgiunW35?=
 =?us-ascii?Q?/o06h3evHFXKodNjURiGC+SjC48F+Ao/3cy7h1VdOuFFfmCflCEcC9gj+tJJ?=
 =?us-ascii?Q?BCNHa4fW+P9W8f8di/1B2MelB5sRbo6vtSw2O2Qf7oeElTFTOzBjEizKx+BW?=
 =?us-ascii?Q?M6wqd6DleO/zQl8UIM/xTRU2/uLcElFMhUANLuNCFSZeUFuLx1uwbM0We2ut?=
 =?us-ascii?Q?SOqzQRAQs7JEGdf3NrSCC/vu2fNrRvBSklsf8OdA+fXyPsWvB7gYZOxVr0XB?=
 =?us-ascii?Q?bGwa5XYeMO8yGOH9p1Pi9mkeGGYjx1rhYl14XIn6K6uayZvl0wRmES1B8+Ty?=
 =?us-ascii?Q?A594FarmM+jyE9suYBpUPYHxO9jHG7DE17TqVzf7By4btMLZnDqW3PkP2CIw?=
 =?us-ascii?Q?aBOJ6Hd+3lSjDN7F+oJKJYPGUmu725rGEOW1Vch+G3dnZe8RTbyUsWJEaYp1?=
 =?us-ascii?Q?nJc9CB2lqEfHZVaxPUufV8lzBZaBVRqtjwBA/MCjGjkpbU++IFjcv2QMHxNS?=
 =?us-ascii?Q?6TGgAIEcrirLi/v+avt1pCESXf+wnjpqVQvhB3K2jzHjB6udXUg1GbeqnH8L?=
 =?us-ascii?Q?+Jb7XEatu5V+GU6h9y7OGy2i1IYBih6p7nEMHa/6NcmaevlCfWpy80RDhel4?=
 =?us-ascii?Q?ocw/vEN+RIE9jh+moZ62iT+My4hjHVOzaqUWvvmcMfVb0Qjl7GO9n4ETBdWX?=
 =?us-ascii?Q?ACu2VA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: selinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR2201MB1520.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0be644-beda-4599-0104-08d99aff81ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 17:14:03.1412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 12381f30-10fe-4e2c-aa3a-5e03ebeb59ec
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pkRALdEpVdylqZ906hFo38+zlb05jeDn24l7BuI7mvXON/qBMOk+6WGJIamUN7GjxCqdj99OjXgmIaz4RLfGbsvnXMu0hHDeGTAwR2lWBJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR22MB0255
X-Proofpoint-GUID: LfxbSnoHr_yqSfI8Z0_Zm508tH9dYrUI
X-Proofpoint-ORIG-GUID: LfxbSnoHr_yqSfI8Z0_Zm508tH9dYrUI
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=854 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110290096
X-Mailman-Approved-At: Sat, 30 Oct 2021 08:24:41 +1100
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
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "gregkh@linuxfoundataion.org" <gregkh@linuxfoundataion.org>,
 "leoyang.li@nxp.com" <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello all,

We've discovered a situation where the FSL udc driver (drivers/usb/gadget/u=
dc/fsl_udc_core.c) will enter a loop iterating over the request queue, but =
the queue has been corrupted at some point so it loops infinitely.  I belie=
ve we have narrowed into the offending code, but we are in need of assistan=
ce trying to find an appropriate fix for the problem.  The identified code =
appears to be in all versions of the Linux kernel the driver exists in.

The problem appears to be when handling a USB_REQ_GET_STATUS request.  The =
driver gets this request and then calls the ch9getstatus() function.  In th=
is function, it starts a request by "borrowing" the per device status_req, =
filling it in, and then queuing it with a call to list_add_tail() to add th=
e request to the endpoint queue.  Right before it exits the function howeve=
r, it's calling ep0_prime_status(), which is filling out that same status_r=
eq structure and then queuing it with another call to list_add_tail() to ad=
d the request to the endpoint queue.  This adds two instances of the exact =
same LIST_HEAD to the endpoint queue, which breaks the list since the prev =
and next pointers end up pointing to the wrong things.  This ends up causin=
g a hard loop the next time nuke() gets called, which happens on the next s=
etup IRQ.

I'm not sure what the appropriate fix to this problem is, mostly due to my =
lack of expertise in USB and this driver stack.  The code has been this way=
 in the kernel for a very long time, which suggests that it has been workin=
g, unless USB_REQ_GET_STATUS requests are never made.  This further suggest=
s that there is something else going on that I don't understand.  Deleting =
the call to ep0_prime_status() and the following ep0stall() call appears, o=
n the surface, to get the device working again, but may have side effects t=
hat I'm not seeing.

I'm hopeful someone in the community can help provide some information on w=
hat I may be missing or help come up with a solution to the problem.  A big=
 thank you to anyone who would like to help out.

Eugene
