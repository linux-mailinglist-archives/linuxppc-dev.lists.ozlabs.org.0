Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A2578E2E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 01:15:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmyW30zNHz3c2K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 09:15:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JdAUamAn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JdAUamAn;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmvSl4jCbz3bdF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 06:58:30 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IKhhSY002222;
	Mon, 18 Jul 2022 20:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pp1; bh=HvwJISJIes48EP0KimoLh5IjrhwO/hrGtEb9lE9ZwIM=;
 b=JdAUamAnrCD52vb+SNgQjfsIxWKm5NCpyNhiOD6voOfUOy4R2IxfSzJtXhk4tsbvn3eX
 t39EYvMpPv3asGDGKsj2b51BSPCSeraYQbZoberpu1Vc0dpraPvMI3hFBvulZTQM62OL
 b9UdzpRZWD+6VUCj8yEz9iNF1LCCn5AJ/cYIpxqTh9CCDTAzg9tfgWNfipt4doyjr8G9
 KH11VmZXV3aWaWIcQPfmevnC3WX2batbEUakoKAclGu5QjYsLuGEF1Xk3pKACPiNWsg5
 QWGbp8kBP+VzrDMbYl8IdyWjNLkEmBiWKkvWsaVojFTXvBDqQgwCLfQgEaACqsE5bskj pA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdet68821-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Jul 2022 20:58:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeTDx6h2G9dOqJTON96HVVA4tNaKB+sNlkjWfYChkOZyNYjAFeec6ryrMdfwpbUitfQaWuzTjFUhs6EX7m0Qp+ln1frHJhDYl7xBlkmFWKICFlc5dA5NIvCwvPATWbJd3Rxq6hvQOwu9ju1LS37sSraMOkbZzvlo0dDaPQUWFBwikfePCPevBM59yWsF2um7HzPzQ6emFGBtMaDwmndd9F6KzXAc3xhrxQQ9dRKdBnDVGtpTr/HdATGpOgMLZH4IlHHkUhyXdu0AL/ycU7Sb9mshd49FsHtkr4vwWbNm1lVFTM9AdxOLg9mON5Id7zFh11dGv+SsTRzi49eeWBULJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvwJISJIes48EP0KimoLh5IjrhwO/hrGtEb9lE9ZwIM=;
 b=CpFemLDBj6JRqDTUyowz7eajOg7GKFcIWKV58SnngLD61G7z7AEy9QKK9SwEIQIbPabSYdFgvrJMSLpMZwEegAEpJw2Vzsz8LuSF8s6dvwg1XCpcjS4nfDbPpF5a6Bs1hSJ9FyK7c/ZZtOZEDj9d0C2gR5fFZ+CfqmJqqJdMPTuiMFH1+1MppjGONKoQ9r4DD2gkeqCYlV/A0jKYOAjB6ZlGNqOzcDh2gDZLyBrNRvuBzfg4kB64b470JGpHB6kmsh6079M0YWecpK4m6gCkfW2Wn6oycGL+ISqFlQg/GKjk7ugbxH03RZM0TDKFiHhG9hDH+pnBv64hHPwL4bEPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from DM6PR15MB2810.namprd15.prod.outlook.com (2603:10b6:5:1a6::31)
 by CO1PR15MB5099.namprd15.prod.outlook.com (2603:10b6:303:ee::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 20:58:17 +0000
Received: from DM6PR15MB2810.namprd15.prod.outlook.com
 ([fe80::8d02:1472:f4be:5ddf]) by DM6PR15MB2810.namprd15.prod.outlook.com
 ([fe80::8d02:1472:f4be:5ddf%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 20:58:17 +0000
From: Gregory Joyce <gjoyce@ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc/pseries: define driver for Platform KeyStore
Thread-Topic: [PATCH 1/2] powerpc/pseries: define driver for Platform KeyStore
Thread-Index: AQHYllPknLKZFnQ9pEGE8ifi5curJ62Eo9kp
Date: Mon, 18 Jul 2022 20:58:17 +0000
Message-ID:  <DM6PR15MB28104EF568D2D114DB85664FCE8C9@DM6PR15MB2810.namprd15.prod.outlook.com>
References: <20220713005947.459967-1-nayna@linux.ibm.com>
 <20220713005947.459967-2-nayna@linux.ibm.com>
In-Reply-To: <20220713005947.459967-2-nayna@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 328c66aa-e890-4199-fb93-08da69003d05
x-ms-traffictypediagnostic: CO1PR15MB5099:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  J84Dl5GEC/HE2Icl/zhYz4VtVVLaWpMAXW+pDTRztUxCaqUdmuIyemagE1gx0S6h/qpF1a9tcwHEqOQj8WbOiM86LpOHlfwgaSSpiDtLcfjWHB8Beu9cQYFetMmdpqm3zdIF/xbeqQnMaZZP1uWpvA46TF5b4jzuXuoku1IaqRkjpj0aRP/giSrQY5pZ5lO4ksxWbuaHfrbjg0SG/2WDiQrJzKpVfPIVhjKzp6y7oM8CIv54mfVEJYMfpSmPOvOt47tG8e8Ova0IVyGo3wL9BkeL7+9bZ51+5ShjuzJSnPUxPkHJwGT1q0JI51GIIkA0TPgAUIvjVl4appdhPnOva+HVHkqVC+/x/OtuqEXXBTisqj7HsHJAErG7lwh7UYW89K0p//oWNWy7vFtncYoF8D9V48l4Tha6CnQlWKW7YdgMYSALMU1nS94djNb3G0B6C28dUDbJt4i4fEPnWGchtn0rPaTNc/n+jdG4cK1mIB08kj2MokP/D4JBnB5xiEH2Jl4xLiyoyujGNRL2G9v1Kyg2g+UynncwDtmiOPx7wV0R7Fs1SPf0Hx66HR6/R8HhzAhmKxhcyo9+Jdsumx0FybbfnAQsO+i1NaNZewPH9ztASo0huLsDaHL5DHV54gI+iOyPR98KTH3hpX3ZjSrMj1TZ5puFTWN/l+rMuDSNbnEFgI6ciDY5y+kLf/gU2lO8GPbOGXCc83uLNlj5yYyXYPk5uij9hrJ/q/oU4ZXG6Oe7PzAmYi0EJhbLKT+c45IBcCZ/HFjHIGfnignTSwAFY5abSeTFeaFgU6Id7RS5K4C/GcB9UpySSbS37PfCoqiR
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR15MB2810.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(39860400002)(346002)(396003)(376002)(71200400001)(38070700005)(478600001)(41300700001)(186003)(9686003)(66476007)(53546011)(122000001)(7696005)(6506007)(38100700002)(83380400001)(66946007)(4744005)(19627405001)(66446008)(76116006)(33656002)(2906002)(8936002)(5660300002)(52536014)(55016003)(86362001)(316002)(91956017)(110136005)(8676002)(66556008)(4326008)(54906003)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?loaoZTTyBqLqv1v0QTkgn/gY+LzErFFMR5nL2JoXIZgd2igubj6+DIsnoG?=
 =?iso-8859-1?Q?m+vvfdFi+BgnEigyCjzvhSS3cQFPhTzc8KhuytBIWwXmrBbho3jrp4Oi3l?=
 =?iso-8859-1?Q?9txdgnw6CmaoNpugQyN79E8R4qAAl5CGQJs7gKKDBt2NBdsBMnmpP2d8cP?=
 =?iso-8859-1?Q?VPRU1AaIciTHYronjzjJ0Wr+xUIABtmQUODQUMoWYwjllU2y1DM+X/+Bxf?=
 =?iso-8859-1?Q?polZRC4O6yIDxVleEPHffYt5NR2BXTZy7utYeol/raVDPWvBUHIXpfR9tf?=
 =?iso-8859-1?Q?gdtlgtGaLX6ph3JUIXZ3pPUBp3T1nWQfTmOPRFmdVyhKPyG6DC8kfr2uHs?=
 =?iso-8859-1?Q?gwgW36usA0jdOdZinXGwXh4E3CWa2EewaNEczAbmvTr/F4U9WfSloRUtFr?=
 =?iso-8859-1?Q?YuGqexTWsP7T3bnXf68Ngndd+TR+8usIRlcdofPLdyVeJ6b6DzXXxLuV4h?=
 =?iso-8859-1?Q?s46n7Qm8x4E1rz8ghM3peOSuX+0eS/kyjeo8zYMItZikmmuaikoaPOK+Af?=
 =?iso-8859-1?Q?rZa6DmTiIc4zxFBxXbbUXeLrOKaS1rYSjT1UAJoAnDcU/AneLVgulZ4Cuz?=
 =?iso-8859-1?Q?5b74VMW29m0WogeoWfb4g00/5wGfA2TSze7O7V89nV10iTe7IJnwzUKexY?=
 =?iso-8859-1?Q?Rjpi33cd+81psLQZw+ejpb4vK0W4ncT7NSqwdGGzTnUHEN4OZpAQkU43g8?=
 =?iso-8859-1?Q?eskeDvwnBM/+ShyYaTZ79wkzwCdkHmS7yMOX6syyuywRvrjf48TbHA/LZG?=
 =?iso-8859-1?Q?FpWMtUNu8ZQUU5x349VYA0U55H8UFBHJF8hNrFj99sC9mJLGx+hN6/503N?=
 =?iso-8859-1?Q?srA4ajmL6u5lkizP6Bpn9Qdu9/KfwNLeWDOAjA0HVACJfsKvuOK8T1rty9?=
 =?iso-8859-1?Q?k5ASfqCQi3Z4I2b3DAySocrvpaww/dn2hQXGcBAKXFn0OXE0oXxmCV1mEt?=
 =?iso-8859-1?Q?Su+UH4UR0nI4WaV0Pap74Yv7DjiDQThjFqRDElDgBsyY3WmOJxiV2sUe18?=
 =?iso-8859-1?Q?CCxPby+VpXMPyRSOi5bVaS0C19TjgGWq87LRBJ6gBc3HMGkhJYmMUlBmHz?=
 =?iso-8859-1?Q?eGUblQ/5etkcNdLOgP7zzCxUL4y7mqtNCdLdiAsFCrm/+v0N5vlR88WWGS?=
 =?iso-8859-1?Q?uWGOMlCWvR+fiurEIRVbpCsGCj6U7zS/KrJfTBomEMK5S9bYwSc771i0Zj?=
 =?iso-8859-1?Q?o2uuA0f4Kw88FgZre0HeKAHpa4ff0bHiLgt1gUoJcrDzLiRZMn58w4Jn7S?=
 =?iso-8859-1?Q?W/SQYMl+Xmyn81W9QxSK1ruh0uFgyde1Rj02lWavArhP1F06aA1un4odsL?=
 =?iso-8859-1?Q?gp43rNb0Z142qUvywqObWcFMe65Qvg8eM4CJ92ZfvLbS5BRSToPZ85QYga?=
 =?iso-8859-1?Q?GCXzLj86AQtrBRtJpGMdo1nBMdGGMnC8B3utFF07XrwwqcwMM2JFKrj4iz?=
 =?iso-8859-1?Q?+L1p9QXk7vrUk4DilD49deEtAIG/inxj6QhmEaz127rsWxOKfWl4I1HrQa?=
 =?iso-8859-1?Q?Pm8t94UbphlbmLMk+4S0AjePmMgVpyuXMOi3ttq62+C8DXVo1Be17FrBWb?=
 =?iso-8859-1?Q?ezso8O0jud3yQCvyxoF0cBt0pcMcOb696ygcqeP0g1SVXvur42XtjjazvI?=
 =?iso-8859-1?Q?fVkn1/ayI8h6s0anGv+FG4F7o2GdeW6JgSViuQju0jaslKmIgUUzRvyP+u?=
 =?iso-8859-1?Q?KFwHCVtFtzxVL1p+wZ0=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR15MB28104EF568D2D114DB85664FCE8C9DM6PR15MB2810namp_"
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR15MB2810.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328c66aa-e890-4199-fb93-08da69003d05
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 20:58:17.0752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WeBidUwGWKTwVt8B2iiooTenjIrqoNTWas06t78jepGqUBBU292IrLvem/wqn3zb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR15MB5099
X-Proofpoint-ORIG-GUID: 9Po1SfuMSkUmDvUh-HJybMlwuq3eQvBL
X-Proofpoint-GUID: 9Po1SfuMSkUmDvUh-HJybMlwuq3eQvBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_20,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=926
 clxscore=1011 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180086
X-Mailman-Approved-At: Tue, 19 Jul 2022 09:15:06 +1000
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
Cc: George Wilson <gcwilson@linux.ibm.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_DM6PR15MB28104EF568D2D114DB85664FCE8C9DM6PR15MB2810namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Tested-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>

________________________________
From: Nayna Jain <nayna@linux.ibm.com>
Sent: Tuesday, July 12, 2022 7:59 PM
To: linuxppc-dev@lists.ozlabs.org <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>; Benjamin Herrenschmidt <benh@ker=
nel.crashing.org>; Paul Mackerras <paulus@samba.org>; George Wilson <gcwils=
on@linux.ibm.com>; Gregory Joyce <gjoyce@ibm.com>; Nayna Jain <nayna@linux.=
ibm.com>
Subject: [PATCH 1/2] powerpc/pseries: define driver for Platform KeyStore

PowerVM provides an isolated Platform Keystore(PKS) storage allocation
for each LPAR with individually managed access controls to store
sensitive information securely. It provides a new set of hypervisor
calls for Linux kernel to access PKS storage.

Define PLPKS driver using H_CALL interface to access PKS storage.

Tested-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Signed-off-by: Nayna Jain <nayna@linux.ibm.com>




--_000_DM6PR15MB28104EF568D2D114DB85664FCE8C9DM6PR15MB2810namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"color:rgb(29, 28, 29);font-family:Slack-Lato, Slack-Fraction=
s, appleLogo, sans-serif;font-size:15px;font-variant-ligatures:common-ligat=
ures;text-align:left;background-color:rgb(255, 255, 255);display:inline !im=
portant">Tested-by: Greg Joyce &lt;gjoyce@linux.vnet.ibm.com&gt;</span><br>
</div>
<div id=3D"signature_bookmark"></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Nayna Jain &lt;nayna@=
linux.ibm.com&gt;<br>
<b>Sent:</b> Tuesday, July 12, 2022 7:59 PM<br>
<b>To:</b> linuxppc-dev@lists.ozlabs.org &lt;linuxppc-dev@lists.ozlabs.org&=
gt;<br>
<b>Cc:</b> Michael Ellerman &lt;mpe@ellerman.id.au&gt;; Benjamin Herrenschm=
idt &lt;benh@kernel.crashing.org&gt;; Paul Mackerras &lt;paulus@samba.org&g=
t;; George Wilson &lt;gcwilson@linux.ibm.com&gt;; Gregory Joyce &lt;gjoyce@=
ibm.com&gt;; Nayna Jain &lt;nayna@linux.ibm.com&gt;<br>
<b>Subject:</b> [PATCH 1/2] powerpc/pseries: define driver for Platform Key=
Store</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">PowerVM provides an isolated Platfo=
rm Keystore(PKS) storage allocation<br>
for each LPAR with individually managed access controls to store<br>
sensitive information securely. It provides a new set of hypervisor<br>
calls for Linux kernel to access PKS storage.<br>
<br>
Define PLPKS driver using H_CALL interface to access PKS storage.<br>
<br>
</div>
<div class=3D"PlainText elementToProof"><span style=3D"color:rgb(29, 28, 29=
);font-family:Slack-Lato, Slack-Fractions, appleLogo, sans-serif;font-size:=
15px;font-variant-ligatures:common-ligatures;text-align:left;background-col=
or:rgb(255, 255, 255);display:inline !important">Tested-by:
 Greg Joyce &lt;gjoyce@linux.vnet.ibm.com&gt;</span><br>
</div>
<div class=3D"PlainText elementToProof">Signed-off-by: Nayna Jain &lt;nayna=
@linux.ibm.com&gt;</div>
<div class=3D"PlainText elementToProof"><span style=3D"color:rgb(29, 28, 29=
);font-family:Slack-Lato, Slack-Fractions, appleLogo, sans-serif;font-size:=
15px;font-variant-ligatures:common-ligatures;text-align:left;background-col=
or:rgb(255, 255, 255);display:inline !important"></span><br>
</div>
<div class=3D"PlainText elementToProof"><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR15MB28104EF568D2D114DB85664FCE8C9DM6PR15MB2810namp_--
