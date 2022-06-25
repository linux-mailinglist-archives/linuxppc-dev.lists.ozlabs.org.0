Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D188555A5ED
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 03:50:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LVH4d4rjSz3cgM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 11:50:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=uSo/TiZG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=CEsnnwKX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2021-07-09 header.b=uSo/TiZG;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=CEsnnwKX;
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LVH3q1JdFz3byT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 11:49:34 +1000 (AEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25P1hvdO018330;
	Sat, 25 Jun 2022 01:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=YDSgHOPA4HhUSlK8qJQhoSXsfNdh/ekZFzA7AENTxSw=;
 b=uSo/TiZGXSgmt6QptsSdQevLL4ZC3bCCtv9EKjt8xNUGWDu/R4dAAK+HQ48MS5yvjUCW
 NvE1c2hPzr0OwhSw6ojQZSsCAa4YANSLtiIBjca+Wvem+8Dhn71kb5sZCFKvbFP2WxIL
 Jq8fcDuqby/w5M4x9n+0s15ww6EdlJ6zLrlBZqyO8sVyotCa0zaSWebqwK67mCcyE+gQ
 qVoraLiybkHW/YiNRLSmBaNWV3tG1dz82VyZz8N6LAq+TFSvzI021rPD1xpQqjgtrPnD
 oAV6Q7giNZmwxlSTT8RpoW2V8cuahrEZlCJmdswECzE7HhMjqlEgUtM8In/cQVSdahAo CQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwry0804u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Jun 2022 01:49:28 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25P1e73R029031;
	Sat, 25 Jun 2022 01:49:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gwrt004yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 25 Jun 2022 01:49:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vqvn6xzfJpXQ4dOH6txb3ZPQNuLm75p5F+1msFv3j6XGKItGROWo4S7avBEWOf4pfJM0nQFLyoqPF9ki+uyluV06s74atWrRm/oYYquwv0GtPZjTVu9GMq+BEXYRCvFzPgSFZWNKFFtoe6Kfr7HtFM5UzJoIT6lPmNGL7FuZXQweSQYNenBLotj2XavW8/0iYq18m2ZDX3YjBe/WKVVtf6cNVgZ425BjW6yK+7dlWm+uDRzGau3+D1G3zddl+htQ7QDnQE0G1hEPt/HnXz4JUv+IELu1Eafn2zcEjGUqg896CRm1XLLO2cmRIXgfsjUMBhXwRNbLYkPnVtjWM9BNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDSgHOPA4HhUSlK8qJQhoSXsfNdh/ekZFzA7AENTxSw=;
 b=YARG7xRcoS5DLbG89BC90UMg9DzNMDaRu1q3k/EmyG+v+YnSeFRfPhaaI4pAophIg/QgGEfA2xxDhfwweP0fHvYV+E0M7zonw+I+MIVYj5G9X+7AAnxvERhU2X/Lm9bSQ3mRH78KBSC8jYZuVCzLawG+qrQmFhBfxfCH2FiJd3Psc3H6NiwEn9gCLYwSqxtmXgWsuxwpEMn9DVsWFBeNDK0ZuW4+i4+MhuJKrgxWbBtmSVIo297KoRsGImNpKlTg70MfDiD+wcCqWmBW8N56M5ugaHJgAYswogTggxX8XDaNIqEhs3Yk28p8YI7uGqktqBqAXsQDNKLnvoxWlXj3lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDSgHOPA4HhUSlK8qJQhoSXsfNdh/ekZFzA7AENTxSw=;
 b=CEsnnwKXjwLraJaBopZ+ZuU1u6e7atOc7dwA5oQ3533j9zlYcx0CtwcwCR5+SgIQDReyy9xwNiozzfICr0uMXFtrs/GrkakR6VrkLa9IFYwL92nm0u6cr+DFoeHVF7tG1wtsYEbuObwqocBvftz8gwKi8PIEIrZIRMrZxyuQKC4=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by DS0PR10MB6200.namprd10.prod.outlook.com (2603:10b6:8:c0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Sat, 25 Jun
 2022 01:49:17 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f59a:175d:d24:949c]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::f59a:175d:d24:949c%7]) with mapi id 15.20.5373.016; Sat, 25 Jun 2022
 01:49:17 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: power9 slab-out-of-bounds in _find_First_zero_bit
Thread-Topic: power9 slab-out-of-bounds in _find_First_zero_bit
Thread-Index: AQHYiA3x5VQrcuJdXESkF1Wg/+Ovsq1fOpyAgAAgzYA=
Date: Sat, 25 Jun 2022 01:49:17 +0000
Message-ID: <20220625014909.v4mv7tnb6fbe5uq5@revolver>
References: <20220624210400.gic4akzlwwdqkxym@revolver>
 <87pmixmxgu.fsf@linux.ibm.com>
In-Reply-To: <87pmixmxgu.fsf@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3da45e4-d951-46e6-4779-08da564cea81
x-ms-traffictypediagnostic: DS0PR10MB6200:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Qhk14hQndd7WvDdg6V9VY86poh02cxehVR8cCqoNN0shLv+mwS6AnevxyrhzQ3BPcGiaRVTMZTGxQ5FO5+88oYIiwgFmq+Z8FXhtx+3Lc4To/NDkEXlQGIihAMnKnYJHkVPNTEeZQdpSt/RnYhcscxT5Y2Z+pswb+L0vo9pmo6dCoQInqexhfbrropNvQlG9fSoqr/juzP9H5YQBDcnQGT/XuzxaUUS1u0J53e2el41S6NnMT4fpF6GFgqu0M82nF3G1ww9l8KVgKjz8u11s2XJB36NFyV4DKBc2POUTaBj0+FQQ6FMIPPoTT4WH4IKPAO7WIDQzVoXG6SIuHG8pubCaG9vShBscGuWmbk8yaLdrWwVoM6t1wOSiJW/3yulAU5POl78IU36MUddvA0pNMM8tcw0w2qbaId76d6of+Hfu4HrapBKytI/VLBqBCm9jfUf0xSBIW2Iy4AxpRTmWWlHKSa4ZZZ7wVZ22ELcXtlXf5/OWsnQdG3tzKX/HsUos7h9SUNajeep5atEdUdV55mt3povyJEkHqCo72Q6x8E0Ev2h9EYkxQXf5JjCzd5xxfns9g4w5lD1F5unTHB6qO1Cv3LX0i9hBeCWHa4QVO3Cl3ou5vL9JCQEw+xH62+4U5bj/J026D1CYNGWinHAuYh/BebSCK3Ti5fdQ9t5XvQRZHBh95+erNCtNrjNPSTbyx9HLHK4CTk5SY+KDK4F+sI1LDxedE+Csl3t8I7jpSKitOFD9LKrvvo07GMdSchgmynGTJCNhH0jHoZhL63QJAPRgsLcSt78MBXBfpeEnBw0P/ukusc+YUscMaN+4eGH/8kGMlmBcLRycBi4HEaMZcQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(39860400002)(396003)(136003)(376002)(346002)(366004)(5660300002)(966005)(6916009)(41300700001)(2906002)(6506007)(26005)(91956017)(33716001)(6486002)(86362001)(44832011)(38100700002)(186003)(1076003)(76116006)(478600001)(71200400001)(66446008)(6512007)(316002)(64756008)(9686003)(8676002)(66946007)(54906003)(66476007)(122000001)(66556008)(4326008)(8936002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?ZIgPcVbrzGr67W4WEQ8JPnfGCICvOaY/08EoIDlYG2JLVxUk3dTozQh/TiDL?=
 =?us-ascii?Q?KlvawSyc8vEIevX0O8OOVlRY2sy5L8Y4M1TaMMziL0zrdMlGpOUfWjjNr5cC?=
 =?us-ascii?Q?/c5wU9sEB2Q0zpCqr2fh6rjM1MCf00H3WM1fLwuAPZAEKKH9dBc3NLOt3CDB?=
 =?us-ascii?Q?G8tp1d+smSyMTTQoxcViePVJ2sN0DFOPvViKGLwlBmgA4jGBHt0xekydrjEx?=
 =?us-ascii?Q?UkYk3/8kaH2fn/gyJ0rpPNKZX9NC+l0SjvLWbGE1wIGO8CqqB3ARQTLb3sAR?=
 =?us-ascii?Q?trfpKnlRNAE0U2VxZqJ1IddBLTsOHpcr1TegRrHKiE1fXFUd4qjwnNFN1+HM?=
 =?us-ascii?Q?3IGTnRAu0DTaEai9ogW8awXCU3Q64lGfay3b3MTes/eJ3Wq41jJ8jiTSzOWx?=
 =?us-ascii?Q?T3JApX4K7Q8Sge9VB1cRQVN0lZB494O0fP0Kf9MwKwKo5y6q0CdMByAQi+Yg?=
 =?us-ascii?Q?whYjbXFyn1bUOi10z5yQHl2HCutgXn6y+r9Q1lYL7f7C+/FILwiKCirHZNcM?=
 =?us-ascii?Q?044TQEapdZWecG3lMyVUIA+j3UwOfDFnLmmMS4/lqJ4NiERN0Uky35UJB/V4?=
 =?us-ascii?Q?5UcpwY9nLu5e2ByIkaR99ydHdIweLBz4d27fTbotSmZSlu8csQKcgFHW2UUL?=
 =?us-ascii?Q?IAz7Wv88HhcXHxYrOfMgICsel1SQk8v8VcQyKO4oJvoHLygqujL4kvI9do7y?=
 =?us-ascii?Q?Pmc1uNW+3Ui4poJ5zUIOn2qcV+j6tekPRRvstoIaKCtUlLZ4IZvGlCSfgBbr?=
 =?us-ascii?Q?bs9Pm871BOM21ConoXTElye9kP0cAnbSjF3tUsXxGAx9bCdzWUI+PEi/xws9?=
 =?us-ascii?Q?fRWOKodyytG8haqEaNNCFE0CUDbajPleXoo0d1FVy4SZ7EAP4+WrpHKLTBAh?=
 =?us-ascii?Q?z4FYC2fi/+phBh3yDWSwpmoSOaJZ4qh82gmZCFTVEQcSdWMekBzp4JfK/CU7?=
 =?us-ascii?Q?VAW1wFNv/Nq3sTqoMoQxQgGOKAZ8a8dHmm3+7ilv3bzvG2nrnDPJBuYolZ1L?=
 =?us-ascii?Q?9vhwV6z0r4MzFbFS8T/vURXwyI+tDE/ZtDxXjqcOBxOtNlFSGqpDTxQgJsyT?=
 =?us-ascii?Q?5KmEqS3TtOMYfjRHMd2dgbpq3YBKmC4egXbuYaJOzI0qRxYNrU1tJKqZytuc?=
 =?us-ascii?Q?bNkXfq1rPlgX/XSwd7c3K5mlSUF4oLqfLXPrLGyJJxVgRHeygDlXfDjqpXxn?=
 =?us-ascii?Q?l7ozsJjEl/+TU2RmbhD1EIL8Irval8WYS9SC7coU8O6Xs6XIHHmaJzaPNwvL?=
 =?us-ascii?Q?RDLw74fWdidn/hjOR8VFCexnYYXdLfmoVuRQQBdjrU7lLQrizkmA3MbmGVSj?=
 =?us-ascii?Q?qRJpApYdPmXmZmBOGoVxkS8EjxmY7b2ospxtHAse7o/hTFwr5JPx5uNfjfkw?=
 =?us-ascii?Q?dnqjHmZDPS8b26kOw+8BomLrOx7J+COXUKtp8YrmFQjDCFYaHABJ1ZyytIA6?=
 =?us-ascii?Q?s5VtbWRynJQhYVRoOWMHOobTgU2Wf3yWs+42IH4iNyqUzX9+ZK2SJ9DxT+/r?=
 =?us-ascii?Q?pJuzf0+8Nn2GZiOyS6Nn75fLD9VkueSoIrMFYNl7wZvrfTcDlWYTLwNvEm0h?=
 =?us-ascii?Q?F55G0LYaE1RCMVTZf8haGdMLJdmdsH7UxufrnNuzE5jXKlrOLjI1k7VNKENu?=
 =?us-ascii?Q?DA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2B25C26EA7BF97458511C50FA5A2CC83@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3da45e4-d951-46e6-4779-08da564cea81
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2022 01:49:17.7722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8qN6E0e2F0u7v9WsvLYIOaG06WvjVB5vKlrCfp0yZ0frXi1Haw520BEp4d2XnvnL2Q5LhosAQlHwPa9ZpKO7Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6200
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.883
 definitions=2022-06-24_10:2022-06-24,2022-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206250005
X-Proofpoint-GUID: JKTNe2aL2G7Od5jN8McG8qc_8BY6mIkE
X-Proofpoint-ORIG-GUID: JKTNe2aL2G7Od5jN8McG8qc_8BY6mIkE
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nathan Lynch <nathanl@linux.ibm.com> [220624 19:51]:
> Hi Liam,
>=20
> Liam Howlett <liam.howlett@oracle.com> writes:
> >
> > When trying v5.19-rc3 on my ppc64 VM with KASANs enabled, I get the
> > following on boot:
> >
> > [    0.174621] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [    0.175501] BUG: KASAN: slab-out-of-bounds in _find_first_zero_bit+0=
x40/0x140
> > [    0.176132] Read of size 8 at addr c00000000f7f0410 by task swapper/=
0/1
> > [    0.176900]=20
> > [    0.177844] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W       =
  5.19.0-rc3+ #8
> > [    0.179461] Call Trace:
> > [    0.179907] [c0000000119677d0] [c0000000075af350] dump_stack_lvl+0x7=
4/0xa8 (unreliable)
> > [    0.181107] [c000000011967810] [c000000000632220] print_report+0x330=
/0x740
> > [    0.181977] [c0000000119678e0] [c000000000632980] kasan_report+0x100=
/0x1f0
> > [    0.182788] [c0000000119679c0] [c000000000634de4] __asan_load8+0xa4/=
0xe0
> > [    0.183560] [c0000000119679e0] [c0000000018b92b0] _find_first_zero_b=
it+0x40/0x140
> > [    0.184119] [c000000011967a20] [c0000000000c5f7c] xive_spapr_get_ipi=
+0xcc/0x220
> > [    0.184689] [c000000011967ad0] [c0000000000c1adc] xive_setup_cpu_ipi=
+0x1ec/0x420
> > [    0.185231] [c000000011967b90] [c00000000a033b3c] pSeries_smp_probe+=
0x44/0xd4
> > [    0.185825] [c000000011967bc0] [c00000000a01c77c] smp_prepare_cpus+0=
x62c/0x688
> > [    0.186359] [c000000011967cb0] [c00000000a00ea94] kernel_init_freeab=
le+0x24c/0x520
> > [    0.186893] [c000000011967d90] [c000000000012b00] kernel_init+0x30/0=
x1c0
> > [    0.187395] [c000000011967e10] [c00000000000ce54] ret_from_kernel_th=
read+0x5c/0x64
>=20
> [...]
>=20
> Please try "powerpc/xive/spapr: correct bitmap allocation size", posted y=
esterday:
>=20
> https://lore.kernel.org/linuxppc-dev/20220623182509.3985625-1-nathanl@lin=
ux.ibm.com/

Thanks, that works.
