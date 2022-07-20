Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40557B7C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 15:46:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnxnZ73xkz3cjH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 23:46:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TGFCA472;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nasastry@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TGFCA472;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnxmp5NCnz304x
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 23:46:02 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KDUc1A006328;
	Wed, 20 Jul 2022 13:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=OJ1qIbTdIbRKuSSPPx3muuTu/QYtWFIEsy1SW3cXNoo=;
 b=TGFCA472NHM+RXh+z47ZOCBCC6OZhFOnTHEvkUM4WnOJeDKpDbYlWFDOMARwl4fcHuu5
 Zlxc5y3+YQOr2Fac5DDh85Svhz7lr2beC0yIiou3XpixjDDqIBpcEl0pS0loLXjTidIx
 7nL0seKW1VaQqsukuWpYiAg/6n8GIufVuvOFnMYWEfQvFOF/ezVN/H9lsO254v5n3w4l
 2FhjTiUyiY4cIn3JCWRChhWajfWp7yq8GdHSmlSNMUX+BklDhohVDGN7ChQG+w4I4GF2
 2t+v57OpgU8Zp5r8ZviL+6cBvFcNX2Fau+9qnG0qV25A8bI1AMurXeSLcvuiNfpHF7kW DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hej5dhyq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:45:43 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26KD7lkC000949;
	Wed, 20 Jul 2022 13:45:43 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hej5dhyp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:45:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5Obc3dq3q7qt9T2dOjvqFAXJ3u8PKxwcNIzEdzTG1e9R1cFMrPhpma/E7v3tXCCmEzfckzFHa+EvHIYbMj9P7T98+jyV6kmwJWqJEKrlcqY+VZ/3k9tkXhwjfMp7eAl9rdShI9JjkNMMJ1ZcUEih0Pk1W9zg+ZK9mfDP0+sQ20IE0lzLgrV7SRYlzd7YKShlNh4Br08Jv2eozn0ZvsgrivQCy8T05ejzHSgtyaV9vuzxic9Fbfru8gD11xyK+SyRAVvbkvy3oY42jLhir83Y63N58reDnQPqpik9xVXxWU+5wEcraNeBjtwtDZGPJ5648IeJ01N/lKiwfAs55N2WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJ1qIbTdIbRKuSSPPx3muuTu/QYtWFIEsy1SW3cXNoo=;
 b=oCFztUOlVb4lzyNmIQvh7gU5xaPJOXJOlTl4WOkj7c4d9KTVCWRxrzXJDxwYJcahpcS3QrkurzNzSFLTMqDCGpKGYjgMpCWLOCX3vSVCP1Z9dJG4iTmGgZ/S2HyaQ/9xSAAiRp/4WQGr3scApjrMx+o7yH57d+DQQlAHFq+L3fcYiDGxW85WTo5hg6pVn+cTEdwPCxIH7EEmxZgWBxFqn1MmC9dYt4Qz4sSh/8g4UP2Od2scPxU6OgsV3c8XgCYopvj6+pLmHNyHh4be1nEcctBMRj/99o6zUyZWk1sBDwSkWSsYppDb52ppoBV3Eu1+VRopy4G5bwyg1K4SPt5JyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from MWHPR15MB1150.namprd15.prod.outlook.com (2603:10b6:320:2f::8)
 by DM6PR15MB2298.namprd15.prod.outlook.com (2603:10b6:5:88::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.24; Wed, 20 Jul
 2022 13:45:41 +0000
Received: from MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f]) by MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f%5]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 13:45:41 +0000
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
Subject: Re: [PATCH v6 4/6] tpm: of: Make of-tree specific function commonly
 available
Thread-Topic: [PATCH v6 4/6] tpm: of: Make of-tree specific function commonly
 available
Thread-Index: AQHYkiXlKOj9W2owc0Ot4z2Hb25Iia2HWYpp
Date: Wed, 20 Jul 2022 13:45:41 +0000
Message-ID:  <MWHPR15MB1150F74E3B8E8A27F3EA50C5EB8E9@MWHPR15MB1150.namprd15.prod.outlook.com>
References: <20220707172026.831614-1-stefanb@linux.ibm.com>
 <20220707172026.831614-5-stefanb@linux.ibm.com>
In-Reply-To: <20220707172026.831614-5-stefanb@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d4334ee-2597-428e-a12d-08da6a562328
x-ms-traffictypediagnostic: DM6PR15MB2298:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  AI3o3du2uUvhd0b21EawJERY+Q4jJZceeXx/8D3FSGszHsuRFZRUMiFJKP1ELkH0jvQf4ZEc2MCsLKuc6EzW0lh5BBDaNxQSH3G4fGBl/66XOFuBcDoJ8Ap0ae1GMALpAk/8GkikK103jci5GI+EQhG4eAZugx3rL0vWELY/+FMAAfRi2gKR+qOfhgCO4EonmNsk7K9N14TG0cBLfVy13uqU/qFc81SRCMlT0nglyphyeoKqh04QyHwbaIhcSKpYkoOd72+VQJBHS0aYF93elWd2zR7f/9OyK4ivjtXp2J9F0oUGndGWQRpdOSGvVT5XvzmOvVqqZcOKc5DDpwzgRLTD9Nkc0DwpngEIWSA4BSPwa824bimXQOtw+9pvysU4USmm04ibHoEV7cUtNcpZV8iQpxsR58l8nf8BWQWq6huXriBQxiKNs54TAQf+aRcKk/snlzM8cxpUDjd6jAc7MtFmxs/mcJmBo3gG4WsklD3OCmNTeGSs+dqD7V0LZYuVOrCyKHbOb1AqWYpWoJz9vtkFq9VhtF1tlAC+Scn8PkPiFnEp17+nmM3a3ZAQCOj/WY/ENedavsK1eN/RJj9IUc7moIarsfiYQrnSYzelCfMDx4nFNjMwBE2zlHMonED6VttjEiEIrdwH4Lh/oSoIb2ezxSKkFABa7a6N7jJ5T1kuX05Ak47fQOUmBUmlBbaZct1wwc4QjQgrMneMwNDSrGuxYPidATf3h0auYOBYr33bYGY6xOcZE/BTYrvAmTnU6/zq/q4O6e0Ju71+9+Nb6Au08VDHbMrpWZl/OjY7PXOVzVXDnDxjwKHs7L1Fimlf
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR15MB1150.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(376002)(396003)(39860400002)(8936002)(66556008)(64756008)(186003)(86362001)(76116006)(66446008)(66476007)(83380400001)(7416002)(38100700002)(122000001)(4744005)(38070700005)(2906002)(5660300002)(55016003)(26005)(6506007)(52536014)(53546011)(7696005)(110136005)(316002)(41300700001)(8676002)(55236004)(9686003)(33656002)(4326008)(478600001)(91956017)(66946007)(71200400001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?xsTMTZGoK42JHulbtwgtcYz8ah3RQU12gzYK2naqMfY3ZQz3pfMxN/jgwC?=
 =?iso-8859-1?Q?pylQ9YbfbDDYvI8W+PNSwFqW8e14pLGDuid4o0wtxP2UrsgtnBagGrCBve?=
 =?iso-8859-1?Q?rT9rl6zyyS9hVfBQ+3KZUIN680brN1t1c4FNxGKlRWS10ypplcGehgZsGF?=
 =?iso-8859-1?Q?1PLQsLeuSmORsbiVcpISOpcwHSQ3lG7cn/sofJAsnxwwzgnLVI0XQ983rb?=
 =?iso-8859-1?Q?n5azMRKiroAjsCYyaeJp+aGTNHB/iysX2uDr7MWczX7kZPH5uSRm7Io9D/?=
 =?iso-8859-1?Q?Sfd5dEGOJYpMgDY4rtBL0LrvUxn4FJD3HRKACk6NE+UVHhJVlU9Caf/fzs?=
 =?iso-8859-1?Q?+etwny4dtx3c5LDkqE1rbid0UdQ0kwalne381MfC+DpWV7vXJN6HFwOCZZ?=
 =?iso-8859-1?Q?eZR3UDbHX3+fgegRBp6KR6ft5MB1G1U/gQl3xIuZ4zMNlQYKPvCkXyMqUT?=
 =?iso-8859-1?Q?y4qt3lvmPDNO8f+L64MRtRXkNOeAVHPbbb/EZWjJG8kAs5/G54XjAxm/vQ?=
 =?iso-8859-1?Q?+cSm6tX3xcTCLyBLh/pSFyDdizh0OCDGxly6GAje+99vgAws3ISrPxl1N8?=
 =?iso-8859-1?Q?VnuLhLcMwheRCoa8NrBPIvuzMt9z2q+3J1D9FuslWtmJ/VbXEOS96mQxht?=
 =?iso-8859-1?Q?Ch1cYtTzkLvLuVrExrgELQ3lf+c/YpyUWQilCoqde0nUPPQsb5TRlD4xqy?=
 =?iso-8859-1?Q?bySf+wochQWCCcveNhZv2XOdJ9duO+wjDvMW6fTRJ+L9iKIkvam5aWdvXI?=
 =?iso-8859-1?Q?HQC/2yKuq/0WBpX8tYJ9ptCmWOJ7cCSPItXPbL9DnR63ErwR9Y5JHC3igi?=
 =?iso-8859-1?Q?2w6VekGi/zi7SE+T4OBxPUyoV44jcpaJ8gGDz6PoBSs5Wgt5077QI3YkNV?=
 =?iso-8859-1?Q?ei910C0al2AVIYBAs/YnMMOS3byECXNHJcy8Rx3FnxtqesS6cZ9VwGkuIx?=
 =?iso-8859-1?Q?Bf+TsHlSVl6/+cSJXMD9gAt1AwyZl6szuDAdilFsnkb6tJYIugKHDgvmXc?=
 =?iso-8859-1?Q?3S/9GecMy7aP2LnTeHgpP7aTBLBu4r/3/jK+AvaM52RJOMPfmFJnowtkei?=
 =?iso-8859-1?Q?XJxvwqfZzg3MI2FsrJqWG3B33PIZDb0IwWhHTDIYKUBOokZsa4udpeYoRS?=
 =?iso-8859-1?Q?WVYH6DJGc9N6LWIGfCIUPkI9mo7PzEa1nnJutA7GnSr/XTqryugiY1xIe+?=
 =?iso-8859-1?Q?25Tv/PavLW8shHEn6N2jP3gOhgb8AAS2GcTLulk4U371Kv3pBr1x5+jXHy?=
 =?iso-8859-1?Q?ZLog5aNzyG1j1bvdDtAAslIaPJNpZiy5mC7ZBpm1NK4VzOo3uPWRpzKA41?=
 =?iso-8859-1?Q?fKFb82bCxIDIIEMmQKhcAoyd+7YbKEx/BpMmDUSifyOhZi412syAZCsjp9?=
 =?iso-8859-1?Q?qMI0D4cJW3lQT5cD7kOdkFxm2lChDO9FfX4CqryRhs7v/PlFGNKvKtOSD5?=
 =?iso-8859-1?Q?zqR8T9FyIOn3c3o41ndAd6RAhsgDiZkSqwnTX9Y2GpGMM5tIXp+1/BlYbL?=
 =?iso-8859-1?Q?zhPfuT9cNNANdN2AV//WlMahvf1pQM1iRLTq3jY7htonLSuDNWK0haqxmh?=
 =?iso-8859-1?Q?/n6OdJSEGBdkLF3bOHA7GIgAuNjzdy9vL7IrcOFtRinOrNpkZ//nyspgWf?=
 =?iso-8859-1?Q?zGB+PotxLhazbjUaOlbXoFQx+DCkwQ675l?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR15MB1150.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4334ee-2597-428e-a12d-08da6a562328
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 13:45:41.5631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lVejXJYQiNwdWToJ8tBJF3zb/TU+24si6LcG3PxH1FCz2cGF8qDrFHAS0wiZUgbfTHoa0+hhY8xH2f6kXcQ/vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB2298
X-Proofpoint-GUID: TIj3yL90uT0o3BTfh44QWtq3E3wK4EzZ
X-Proofpoint-ORIG-GUID: zEXIhv5Yfnnu-cypZjogbJMckWdYiKmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_07,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=912 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207200056
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
Cc: "nayna@linux.ibm.com" <nayna@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jarkko Sakkinen <jarkko@kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=0A=
=0A=
________________________________________=0A=
> From: Stefan Berger <stefanb@linux.ibm.com>=0A=
> Sent: 07 July 2022 10:50 PM=0A=
> To: kexec@lists.infradead.org; devicetree@vger.kernel.org; linux-integrit=
y@vger.kernel.org; linux-kernel@vger.kernel.org; linuxppc-dev@lists.ozlabs.=
org=0A=
> Cc: nayna@linux.ibm.com; Nageswara R Sastry; mpe@ellerman.id.au; Stefan B=
erger; Jarkko Sakkinen; Jason Gunthorpe; Rob Herring; Frank Rowand=0A=
> Subject: [PATCH v6 4/6] tpm: of: Make of-tree specific function commonly =
available=0A=
=0A=
> Simplify tpm_read_log_of() by moving reusable parts of the code into=0A=
> an inline function that makes it commonly available so it can be=0A=
> used also for kexec support. Call the new of_tpm_get_sml_parameters()=0A=
> function from the TPM Open Firmware driver.=0A=
=0A=
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>=0A=
> Cc: Jarkko Sakkinen <jarkko@kernel.org>=0A=
> Cc: Jason Gunthorpe <jgg@ziepe.ca>=0A=
> Cc: Rob Herring <robh+dt@kernel.org>=0A=
> Cc: Frank Rowand <frowand.list@gmail.com>=0A=
=0A=
=0A=
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>=
