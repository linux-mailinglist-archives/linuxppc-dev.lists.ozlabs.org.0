Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B6457B7B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 15:45:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnxmN2h7hz3chZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 23:45:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l2uZQXhq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nasastry@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l2uZQXhq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnxlc1Mv7z2xkY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 23:45:00 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KDfpx9004515;
	Wed, 20 Jul 2022 13:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lyxOMl7wa15/u/YpmV0t3r+nP7ZL64d3gsWO8kGh9Z4=;
 b=l2uZQXhquCUQE4UnX1Z2YZDm1H2pVlq77xzd6Ky3YhMD1KFzySIKt6VDh5GonIXnZCTO
 mAmCoSa1DCm9+WmIm2cKXp4CW3Nrl6INSb20fG/+Nkm78gtL7SSluAvyJUa1fNqYDf9T
 EfOS2+JYjE+urvDw1Td41Zge0GRAepXEESFy0YdBeQ9+jfd0OVRcboyCNT87Hy90Auav
 bpubQjOlIQTCiXh9u6k3rFl780aCdnxIWWVyq78PseJW4GREi2OoQUaTjAL2wHHAXTrp
 ch4aAUz6wHso8irI14R+7ZO/CgjuU4xC732Zgbba9dgqsTyq15bv2o8ijrcsk+lvpKNY Yw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hejtn032w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:44:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9IrrxfcjFqFRtgcEGrd8WCjpDDQOGeeXe3z4zvo16beStLIeRsfKxotCudlqy+fI/CbFzvRI2SPGbea6zIRakUpoHuzujrpsOMkdv7ptFZh6j1xtrNNNSwJpn8/b1x2brZy3vLBalj6RKu3td07iha5iq7ALr1vvdhQVN0k76uKCfgpF7brHB5Z3wO50d0l8HWA9G0V90szsojw14XX+8QQD8ItqxuTNhVpXYp6frCE5r2gyunFKjePS6Qq4Rgn01Ph0yXxZkkCwt1ZcZi1Gy55Us5Gi23p/v1JBsX0pVM11b73BWPqhpdDG5JWZJeu4aqaQOh3coWh9EOaB4LHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIqk6YhnNZUx3FdZasznfBWIQCza7m5iDRdvByYyM0w=;
 b=TQXE0IU9NTz2pT51XgHHqzSHWqdI4X4DAC1swSckqd0bUqhEbYOz9sDZJQs1jUHw8XP/9K3/LvvLmxweWo9klXel/zWwhILlsOZtdW0YQesPmo1dqEbyCkrEpp1tR5HVcBQu5Bq/QiXtMK2JR4yByAClxM6/LSDa1yWd+ZYf1dxeLcJ+uyryd+SHGz+WtlJ4ahoYQ7c5H8rpfn39n+qXEfgOpcSu1wnJLyE3j5WS8vP4pRgye7JT5kirWvPDLU8DOVKEFiCOOsruHVm45T4Odbz64Tq0N1Ue0TKqWwZ2GWSEILdJp9IipMXj1Unq8l03AN0Z598drbKaxogaV2+fkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from MWHPR15MB1150.namprd15.prod.outlook.com (2603:10b6:320:2f::8)
 by DM6PR15MB2298.namprd15.prod.outlook.com (2603:10b6:5:88::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.24; Wed, 20 Jul
 2022 13:44:50 +0000
Received: from MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f]) by MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f%5]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 13:44:50 +0000
From: Nageswara R Sastry <nasastry@in.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>,
        "kexec@lists.infradead.org"
	<kexec@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-integrity@vger.kernel.org"
	<linux-integrity@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 3/6] x86/kexec: Carry forward IMA measurement log on
 kexec
Thread-Topic: [PATCH v6 3/6] x86/kexec: Carry forward IMA measurement log on
 kexec
Thread-Index: AQHYkiXlR/ZXiU4wukyBKaCVWBLax62HWS7O
Date: Wed, 20 Jul 2022 13:44:50 +0000
Message-ID:  <MWHPR15MB11506A98B95F5834365FC510EB8E9@MWHPR15MB1150.namprd15.prod.outlook.com>
References: <20220707172026.831614-1-stefanb@linux.ibm.com>
 <20220707172026.831614-4-stefanb@linux.ibm.com>
In-Reply-To: <20220707172026.831614-4-stefanb@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 783de2d6-dc19-4896-3a1f-08da6a5604a4
x-ms-traffictypediagnostic: DM6PR15MB2298:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  D4+K+ZwkVb6TsNQwAYra0mOj++KZ1Z1FECMEP4mxMhT9nRezRE/niHJXCN+HixYDXwZ38RekB6TfU706XNJWny96lgEbJlwSF5cibrY6pFhayfresUjz53vbaSQkHGGpnV4AhSEh0zJ36v6FR6X+S2lJmCIPyQMoF0LjDYa3qwi+pidpv+s/8XoWvaSYVmC9EEuee3fwn1TxgCFX116Q+VQDfD0Im49mMw2pMxeYRpwp+t+CY8DuKGoVZMJVOywT1r2h3rgDGWFzdxcdRhglxih1RE21MQXa/eusXDT9S+7Q5oxEz25q+L69T8mHRXUQmrKuiEFX3vyZ3B/pySNB3IeAwJqrTHT3o1+sfFrOe1L5V98Om75X5ce7nGnPx2Yn9q7CUvw3kmSt6HCHvXlBwf9Q+dUANzlCUMP33cipjR4NLkaM+F+TpYNGvC2hPCy8VTZs6C/wO/p6sX6BAwWw2UhQtUdMQ0zepXBCUoyXYhtqbQxtv92WpVcylkLs5LB+Y2yGj8yiPCdQvGKX3ZkbJNhcifMMiO4LlsSqioWRhfQBZgCmuroq+pj86iePwU5tdVOZ7AU98r0wmaxOA9jcw1vHJ2kh/8183BzYaS8rwmI8ob1vwE/YAp5XZxcIS2EL4woXC3KjlQb2TOHo/dsx1gwhBv4+EVsuw9MOADtFGzzZtfWJHW7R40OBahU3Ragwl5j6+v5ydSL7HPeCVTjDMTtnSYmKjd2KvzNpaYWvLZDPBylE7GLr1pdDhwbMbwCqEUhl5/RKPT+R6haRy9j3QzmDgYjTf2s2EV+hZgVYZkJVSFGonIDmPazE3TUSk0UzfgoxHqhq8j4QDyj0AdrMnw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR15MB1150.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(376002)(396003)(39860400002)(8936002)(66556008)(64756008)(186003)(86362001)(76116006)(66446008)(66476007)(83380400001)(7416002)(38100700002)(122000001)(38070700005)(2906002)(5660300002)(55016003)(26005)(6506007)(52536014)(53546011)(7696005)(110136005)(316002)(41300700001)(8676002)(55236004)(9686003)(33656002)(4326008)(966005)(478600001)(91956017)(66946007)(71200400001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?oM5V2evLnG/whzVuSVO7Kj3GT20Hzgsm9IxNSsrM+dCW2eZAXOMcP+h5hM?=
 =?iso-8859-1?Q?c9i9X4PGIds47BZLR1x0PXynyMOBTKg3w68yeL732EBCTZTAu0wIIt9O81?=
 =?iso-8859-1?Q?4ZxJfjOlrW3agV+eqAsVJ2QZYnmxMZ3D95XZKd9/1Jbdtn4j5LuU7GwJip?=
 =?iso-8859-1?Q?mqkSMskVBU9qm+6pK4e+eulzuHqrfoX6lgVzdx851fUUb7VQExv2ktsk1y?=
 =?iso-8859-1?Q?zwmiCm4+PtUMWIplkZbRZVQV3OF3FxxZmtoOzhVnHPKFQNqet9a/5Rg2zE?=
 =?iso-8859-1?Q?gOa/F8orrMXmIPpD4iWBj3kXWloMqq6ImD5NMnB3lX5BKPUojK3jRQbMWv?=
 =?iso-8859-1?Q?fzWFr450d9/o0o9SQgEIoci1OIUcAFEi6t0iqpfZvLDA0wHfqkpLt/kQC0?=
 =?iso-8859-1?Q?i6hT11vvo3uzdph9FPp15FzTRuSL9fvo0cvMoBZtjD1/AIPT5/CYK+rrbX?=
 =?iso-8859-1?Q?EXkcg182SnXSt0UY4rZVc5x0jEeV4rDQMFD9f13/thoOwk0UDg/86puOTY?=
 =?iso-8859-1?Q?O+sT0TQoEh7GownnYfcjrYMrC9wwNro6BGLSg7wUQDuu9gQNzs2vtWvbLz?=
 =?iso-8859-1?Q?7DqOizfa9TnhF/BcDItDF1qiLmS/kZSv91ceGsKT9vsY4AsZa+DAqU+aTZ?=
 =?iso-8859-1?Q?4u9n7mLwLJkn1oUeJBBOVMSfKq9u9WDFDcUZOLymrnfyurMnYLNlHu1oQU?=
 =?iso-8859-1?Q?Fel2FJb0hFH23EKeErRF8HIYYdi8mNriAAnzS7fRBuLhn8oHU7nNS6w7T0?=
 =?iso-8859-1?Q?+ngR38VCqW0QYu3LcpaUiM0u4jtjig5heF6wKPpUDbqwdnheTmE1WxnLxh?=
 =?iso-8859-1?Q?aYIL6bZtj2d91Ls/iRdOL98d361ra00N/NxZnZ1RDAOIl7beBgyjAI1eUJ?=
 =?iso-8859-1?Q?3CB6e2deSyOXLCR/cBbBI0nz5TfEKqPgSoTcRIQ7agtc2jj6GOg2crv2ow?=
 =?iso-8859-1?Q?GjkxkGWYeA7aZPzkb8dWnWSiXzKVp+DIwUKVdn0j2c895a2DfdhbHKHMk3?=
 =?iso-8859-1?Q?2JzhxGTzRran4nqJL+h9NMUpuoJasjOvt94oeYft1+16bQzMAnxfXQ7yvw?=
 =?iso-8859-1?Q?zFdq2lJrEUOyQQJ+IyhjnjOa2McdFVyNWC2smadCOkb7fiWPyFGQstq3V9?=
 =?iso-8859-1?Q?HEuWm3atGKSPCR3DSdOXnOD9ounfybkLCPJoRMkcLFeLeUMGFMIWLBCaKG?=
 =?iso-8859-1?Q?eTxLPkrv45vIAhsclpZVxbc08sN5lnhOw3hgpYGdqUhNY1v2JcBsAWLxMt?=
 =?iso-8859-1?Q?gaiCEmIIOfDa234PzNZSCtTUFjrfRYdH5zea2/N/3mwGo1hoQpXjR+qnZB?=
 =?iso-8859-1?Q?n9qKbpSftWAyUVXWikXNdcBTk5yTD2Tc3X6gdRgmVGdlUt7gPc4nhfM8kL?=
 =?iso-8859-1?Q?L2kwC7XPOpLu+qnf0rmuD4khgbeMFMiktj0n3Kiy9QujK83Zbojyg3R7Q2?=
 =?iso-8859-1?Q?uVZeilSlUvP5CeIJmynvQf3cpg71/6xKo0oYs7rPZoMZ7snEUvXLJqwoZM?=
 =?iso-8859-1?Q?UkoL58CsgcjgGM853S+OvMmLiGtMA6+bSXbGWGhbuMoji74DGtKAUtJBSl?=
 =?iso-8859-1?Q?Gim9WFYdfFdvk6kCgdhhZC4g1Jz9EHN7AwSJvBfn+XTtbTmFaHBhun6EMo?=
 =?iso-8859-1?Q?HbxXpAjH9acgkdahxfYVIQEtOkLUuNINES?=
Content-Type: text/plain; charset="iso-8859-1"
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR15MB1150.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 783de2d6-dc19-4896-3a1f-08da6a5604a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 13:44:50.3637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chSQsIRviV+2LWLX7X8IOLDvgXrxFFBZtIuuMGOTzFa+p4iOGAgwyEkTd4ShoNst90VTHlrRsoBBkbGjAMuXWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB2298
X-Proofpoint-ORIG-GUID: zl9EBmHolbvbYf4TOdfH6Zip-2Y-vo2C
X-Proofpoint-GUID: zl9EBmHolbvbYf4TOdfH6Zip-2Y-vo2C
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_07,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207200056
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
Cc: Jonathan McDowell <noodles@fb.com>, "nayna@linux.ibm.com" <nayna@linux.ibm.com>, Borislav Petkov <bp@suse.de>, Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



________________________________________
> From: Stefan Berger <stefanb@linux.ibm.com>
> Sent: 07 July 2022 10:50 PM
> To: kexec@lists.infradead.org; devicetree@vger.kernel.org; linux-integrit=
y@vger.kernel.org; linux-kernel@vger.kernel.org; linuxppc-dev@lists.ozlabs.=
org
> Cc: nayna@linux.ibm.com; Nageswara R Sastry; mpe@ellerman.id.au; Jonathan=
 McDowell; Borislav Petkov; Mimi Zohar
> Subject: [PATCH v6 3/6] x86/kexec: Carry forward IMA measurement log on k=
exec

> From: Jonathan McDowell <noodles@fb.com>

> On kexec file load, the Integrity Measurement Architecture (IMA)
> subsystem may verify the IMA signature of the kernel and initramfs, and
> measure it. The command line parameters passed to the kernel in the
> kexec call may also be measured by IMA.

> A remote attestation service can verify a TPM quote based on the TPM
> event log, the IMA measurement list and the TPM PCR data. This can
> be achieved only if the IMA measurement log is carried over from the
> current kernel to the next kernel across the kexec call.

> PowerPC and ARM64 both achieve this using device tree with a
> "linux,ima-kexec-buffer" node. x86 platforms generally don't make use of
> device tree, so use the setup_data mechanism to pass the IMA buffer to
> the new kernel.

> Signed-off-by: Jonathan McDowell <noodles@fb.com>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com> # IMA function definitions
> Link: https://lore.kernel.org/r/YmKyvlF3my1yWTvK@noodles-fedora-PC23Y6EG
> ---
=20
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>=
