Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3A559B0EE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 01:55:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M9FqK2kNPz3cf5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 09:55:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O7CoJ0VN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=bcain@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O7CoJ0VN;
	dkim-atps=neutral
X-Greylist: delayed 2080 seconds by postgrey-1.36 at boromir; Sun, 21 Aug 2022 04:20:32 AEST
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M96PD6KF9z3bls
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 04:20:26 +1000 (AEST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27KHc0rs031246;
	Sat, 20 Aug 2022 17:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=l8KECb0a5P+N6A2RzAwTF9GB+WOdmqpC3DwXKrkL2YA=;
 b=O7CoJ0VNu1C3eXtWEuNvCh52VBzIBrHipn8sB/NADs4pG4PAirxtCPj3oefR0me6hck6
 7H64WxYsRSBNxwomecxwtYiVnC9YWJnAJ5sZf1RR/taYOpqwgQmYKY0QmOID2HcZI1+P
 0iSvRgpz6BhIE4khWfhdLJ3lajA4o9lLgKdsQ4fjDAxQAb5oQUJ28kPB/l+uvgcDC49H
 LFI+lx6yw5jfs6yyOmFzJZ6bvtYaMIvwF1LuHkS8hCQ1J9HbGNAAQMfXr+B3G/g8qETv
 fKz7oW0XyCGR27zHlFTpcybXaZAzSOp0J1VmnYTXoEgpK0O6cZCE7tBjYIo4H0+BdNns 7w== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j2vwsgh6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Aug 2022 17:42:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDNIVqnEzBes02dldfgJZJbikZJ05/hZ87OhECQWj/jQSrNq6Bg1fzwqMcZBSkIeeM1QSt51D0Kfyonq92SkcnJnSDBMk0Gseg92hkLIEbnDzQXr/S3NPdwqPVT4ywLhDE98D8RyJ/Bp8bFFegd5l4NIt4yAIZVlz+5pvs+/wBoZcYjMPNdlPngJJWE/7jqbfGkazSoHmXfLq0jBNtNAQWZQXuyQcUIuLzolrh371PaglPTeVMEbaaBsJgC/y/402zX2267Quu4ZSfUni2+LEqb9JfV/7bNkTOXpRhWHvVfx187B6J3+JaY9mpxjgbn666qRmBrLa334mFNNuTCJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8KECb0a5P+N6A2RzAwTF9GB+WOdmqpC3DwXKrkL2YA=;
 b=muDZ4Sv9XqZFWs9lt0LDAoGrVcXMYTqV6fN6raxId9EplHoKbvJN94tAjURVOWO337YiKE7HCMR1zFcjFpmSpr0r2AgF+IVQSPIZKQab74gE7W/q2aAsQbgZFXHk2DybSALFUtxrwicl5MwwHpf/hhdgJi2sjbqkpI4vLWUkyQxvH4JO4dAkOs2Q4IqbDY6kT1oBvZ0lKujRdZ1lt9ZJbwHVf+6q9NRovh/m4vZjDFndFzCPXVYTUrrocfdhmqhevyQeT0kKUSQwG/2/5+t+kEf4aNkl6zSSKABad3gLcb6hUMxB5AAwHYoLStnDTtWPuxeFbdHvIlsvXCt6Lx7Eaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BN7PR02MB4194.namprd02.prod.outlook.com (2603:10b6:406:f8::18)
 by BL3PR02MB8148.namprd02.prod.outlook.com (2603:10b6:208:35f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Sat, 20 Aug
 2022 17:42:15 +0000
Received: from BN7PR02MB4194.namprd02.prod.outlook.com
 ([fe80::2940:82a9:edbf:233d]) by BN7PR02MB4194.namprd02.prod.outlook.com
 ([fe80::2940:82a9:edbf:233d%7]) with mapi id 15.20.5546.019; Sat, 20 Aug 2022
 17:42:15 +0000
From: Brian Cain <bcain@quicinc.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
        Richard Henderson
	<richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
        Russell
 King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Huacai Chen
	<chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven
	<geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn
	<jonas@southpole.se>,
        Stefan Kristiansson
	<stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge
 Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas
 Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
	<palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
	<gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian
 Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Richard Weinberger
	<richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes
 Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen
	<dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>, Chris
 Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-csky@vger.kernel.org"
	<linux-csky@vger.kernel.org>,
        "linux-hexagon@vger.kernel.org"
	<linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org"
	<linux-ia64@vger.kernel.org>,
        "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>,
        "linux-m68k@lists.linux-m68k.org"
	<linux-m68k@lists.linux-m68k.org>,
        "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>,
        "openrisc@lists.librecores.org"
	<openrisc@lists.librecores.org>,
        "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>,
        "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>,
        "linux-sh@vger.kernel.org"
	<linux-sh@vger.kernel.org>,
        "sparclinux@vger.kernel.org"
	<sparclinux@vger.kernel.org>,
        "linux-um@lists.infradead.org"
	<linux-um@lists.infradead.org>,
        "linux-xtensa@linux-xtensa.org"
	<linux-xtensa@linux-xtensa.org>,
        "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
Subject: RE: [PATCH] kernel: exit: cleanup release_thread()
Thread-Topic: [PATCH] kernel: exit: cleanup release_thread()
Thread-Index: AQHYs2yILqAnWShL9EWzOAU1IN8ne624EWIQ
Date: Sat, 20 Aug 2022 17:42:15 +0000
Message-ID:  <BN7PR02MB4194B2148C8F9183AD6504B3B86F9@BN7PR02MB4194.namprd02.prod.outlook.com>
References: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20220819014406.32266-1-wangkefeng.wang@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bed88a74-80a3-4dc7-cab6-08da82d351f9
x-ms-traffictypediagnostic: BL3PR02MB8148:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  AV5EpvqBt2N2cXDr9uiewpurSUtlKfTxImlHstq/Aokz6os5kyjrwF+AbNqotkCqy/Re5l+MIrvjNbhbPMdmw3PtqSYC+6TtX/sK0JDTQJP6IbwEF7MAoHLO1XU1EcCCGGYneSVu7WsefeXd1ydxzEZEIx9fueFXHCEwHjihzEYn+BwO0MoeshN+WfIXxdg6RxtKw84I4j8kJdNCtmNhS9MOwXVPJBPPyl1NyVgRkQoUDey4G3eXuJZzXLzTTcr9SqbWvHxZ6bZ59k1Y6hmYiuHklEfJSyAYcjK4Bk4ov+xPRdtT6TS9VLqWKvDOH2AXHBDbcwzcO+libHJq/ljUfTbqE92P1R3vuoeIOMSllgrfk+XtJfWe2fAWg69Cp26bd/goLFrrMZdeeE/L0mZihtkN0Le+H6hzfWWai2erb5ET6JtEcjO2rOejmrYf7r9wNYC4LdVxS0mg7J0p9l5k08D51iv658YMepE7KVeZ3FHoCuViuyHVYTNwpEvvU8fNY0AIABrnkQwrHP104ho3Qw9aPIj2ecMNEJSE7CF06XENQqlVEvxZKRlWAtZoO81/1bCrOVfGYYGwYGEEzU9BZqXYDsh9wDMBbp14zGI6YhZM4Z6pIIpPtszH4iX/of4RkLvXAL3JcQCKApEIfxifItmK1Cx0sskJK+9kBaQHZLbwE+0Fl+Hw/JZFezZPu0eiIktohpqhEWmNJN02X4PvSFrIsgEJe+pb3LPDl9p7CC8HFcApMlM0f08yMGTyh3swYedqDchXY6Xpyt5oQsAlY/FzqEzfyvHZ74jH4HNcIXk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR02MB4194.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(41300700001)(7366002)(66946007)(558084003)(921005)(71200400001)(7406005)(76116006)(110136005)(316002)(478600001)(64756008)(66476007)(52536014)(55016003)(1191002)(2906002)(8936002)(8676002)(66446008)(66556008)(26005)(9686003)(38070700005)(7416002)(86362001)(186003)(33656002)(6506007)(7696005)(5660300002)(122000001)(83380400001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?akyGtmscOlZZT3WBv5SUQIeSEesAeC+pYGYMwuAVcNW7JrL8YYZ3vOTK37uR?=
 =?us-ascii?Q?b4H5o/SsQkIAMMytEbRn+Exm89f3cOoGULISlKRhFfVXxTFkW2lT6fQ1aP1x?=
 =?us-ascii?Q?/UtR1q83wjC10yKpiXWOFFgMylVLnbVbA6aMiZoLLjajlb07wPPluQCEU8UF?=
 =?us-ascii?Q?9FuCGOKGWO1czdYy6dSmevIRVjl3T2U+kOpjcSZt7CfGIK0afIhrUx82MNwe?=
 =?us-ascii?Q?bYKKjVcwDeo4qDkDSwTLAkunYX0CBxOQc/p0yrFoDM3y0cYcZNg2g7jUkZY+?=
 =?us-ascii?Q?pHALKntnyVxunguoqqSHBujUyv/hECsjHXXKb/aDiaC1G93jtKps7zOHm4uQ?=
 =?us-ascii?Q?0ACwc3xq4WSVy0L9G/HBScIA22XUSlmJ+hegRYY5OBZydlHMvXH4Er/3inIL?=
 =?us-ascii?Q?c3iCh6Q4Qgwk2mr09s9wu9JuSOr9WWcwyQPkeT51UY4jccBIV/oERRkA2qcG?=
 =?us-ascii?Q?KfASbp3VnRjIYJk2z81FiRoHhbCPBTsr2ySjgX/WrrYg/AVH/DrRvixyB6l3?=
 =?us-ascii?Q?lyvjlN+C+vm9bAnLa5BdsfTPTMlLNrmv43U6pfHQNKWdf8eO/vohTd9FddXc?=
 =?us-ascii?Q?ybbCOaT4p75dkV7bNskCL1A39Vk+aXV7iGkX2yOx5sI2C3EEpSIGVBylzkZb?=
 =?us-ascii?Q?CMsUO6LWuinPwJIfRklA7Q/DKDvBsry4drMw+2cUzvH94uaKpKij7rVQNgwo?=
 =?us-ascii?Q?h2qjIqW4UZZ242kg20y27rTMFX3eqvdLbfUJp3bx6EM/sI/98vKHmMdVRNv8?=
 =?us-ascii?Q?3QR3QovJRZzIAKI8AnhNIeltm0iXaOAhouIzDiNRmbvsbVqp1YiGBB5bFSbW?=
 =?us-ascii?Q?2CbHmxg2aHDiO9ODQHk2vpI+6hHMZ/jluYNZIWoHF+EbXfgYQB28/zqdVGbs?=
 =?us-ascii?Q?zVeA4+um+0yLHpzK3Ae9S6nKMsYLs1bYkFhhNypDa9DizE6iyX0qbRifviCU?=
 =?us-ascii?Q?B5OMUFwu78t06xK2N7Hsb1DbFIGSvLBIyyHb+EVBIkwtTEAqQIAlO7Qacjmg?=
 =?us-ascii?Q?wDNuk6HC7oMYtnrWUwoGXxWg2FhI7pMRKglU6UHXbicl52kVYywIHZFo+nXQ?=
 =?us-ascii?Q?Jo5B0uNrvx09NCQjDJUP1LRzmN9kSRMQAYK8argb9EcWwq2/hgMxah3LNhGL?=
 =?us-ascii?Q?bmVSURUCr1yMRG46+xclnT4+pBik/qoqkA14M6jbrXKRXzb6AGmjw7rFRpq3?=
 =?us-ascii?Q?XmIa8GS7mTujyK19Pa6kIXDFolQezi9gUJwKQxkTKIRmWsJggRT7OPVZMG0L?=
 =?us-ascii?Q?drN1db+Bxfh73zcCTj2zZnpXALtjuhmOAoEO8SupllELOWeDKKsfL2PkcazU?=
 =?us-ascii?Q?Rhy6yv9srgqU6OpIGo8Abj37VlkIAcJgcta5vyG9t5hZeE10TIS68wt7zteX?=
 =?us-ascii?Q?eyQoq0QL7HrkipChU0QwTqw2F7T5bYXBjRhEQhJF27ImAfpCmY1ffCfC5b3+?=
 =?us-ascii?Q?z9JGRgsyzPVnk80e5EQWUrjWyevkriHVlKFxsVgPHHm2DdPvKvJgwxoRVqqn?=
 =?us-ascii?Q?7DraPzYAK4l/jcIgrK/XJvUXEEYTI2op5rh8Zb0zHcIg/NR1s7sOI67i2yMn?=
 =?us-ascii?Q?mPlAa9fPXmSg05r6XQfh365ddNBIDKH9VYqQarmu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR02MB4194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed88a74-80a3-4dc7-cab6-08da82d351f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2022 17:42:15.1225
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0oaknIDsXyHkElNkKnjLQANfm7YCArQcQUNHG2vXfTJqb3ZROPDTlQUfRFXq/qljjkpjiiy20HF2ff2l6Haa8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8148
X-Proofpoint-GUID: 7q-D4RhPhNoM_ZXhkD9rMMr5rfMoWiJM
X-Proofpoint-ORIG-GUID: 7q-D4RhPhNoM_ZXhkD9rMMr5rfMoWiJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-20_08,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=792 malwarescore=0 phishscore=0
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208200075
X-Mailman-Approved-At: Sun, 21 Aug 2022 09:54:35 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Kefeng Wang <wangkefeng.wang@huawei.com>
...
> Only x86 has own release_thread(), introduce a new weak
> release_thread() function to clean empty definitions in
> other ARCHs.
>=20
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---

Acked-by: Brian Cain <bcain@quicinc.com>
