Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BBE117FF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 13:10:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vsxN70n6zDqSK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 21:10:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.66; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=horia.geanta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="EVSh/h1s"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10066.outbound.protection.outlook.com [40.107.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vsw15yhHzDqLq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 21:09:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzfsPx7YAbBU5X/kFBDF4AXA7y9b+Z3Lom/OmYxDcpw=;
 b=EVSh/h1sVtD6SfE0B3zr3efiltlTry3++XolHNDxazjNI7EqpONOKxk6xGz8jEkrdQnMKKHJi8xUQ9r0C+Ocz2iGQfIajEYSt3ONixOumW+DtMVEYFznFNDcNYMrd9C3Kk7YHqxNSjD+kojJ+czvkFr27VqcQ5iyYyhmeXG8EBc=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3838.eurprd04.prod.outlook.com (52.134.16.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Thu, 2 May 2019 11:08:55 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::484c:ab68:81c4:51be]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::484c:ab68:81c4:51be%5]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 11:08:55 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Vakul Garg <vakul.garg@nxp.com>
Subject: Re: [PATCH] crypto: caam/jr - Remove extra memory barrier during job
 ring dequeue
Thread-Topic: [PATCH] crypto: caam/jr - Remove extra memory barrier during job
 ring dequeue
Thread-Index: AQHVANduZftT9y+WdESheXU0ZYEtAQ==
Date: Thu, 2 May 2019 11:08:55 +0000
Message-ID: <VI1PR0402MB34851F6AB9FE68A2322EB09E98340@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <87pnp2aflz.fsf@concordia.ellerman.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 610c074c-ffea-45cd-2c18-08d6ceee9171
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0402MB3838; 
x-ms-traffictypediagnostic: VI1PR0402MB3838:
x-microsoft-antispam-prvs: <VI1PR0402MB3838A574CD2D7F71206DB62998340@VI1PR0402MB3838.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(136003)(39860400002)(366004)(396003)(199004)(51914003)(189003)(25786009)(71200400001)(3846002)(71190400001)(8676002)(6116002)(6636002)(8936002)(52536014)(33656002)(2906002)(81166006)(81156014)(68736007)(99286004)(54906003)(110136005)(76176011)(7696005)(229853002)(14454004)(6246003)(186003)(446003)(4326008)(486006)(26005)(44832011)(476003)(9686003)(316002)(53546011)(6506007)(102836004)(53936002)(55016002)(305945005)(66446008)(14444005)(66556008)(64756008)(66476007)(5660300002)(74316002)(76116006)(73956011)(66946007)(86362001)(478600001)(7736002)(6436002)(256004)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3838;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uw5aowX+w6lEPnp4sgy4V3OT9JWoQBb8C9InHDDwxs2AV8GehDYYGaUVwc1KjgONXOgPlGFuuaLApuy5u8zhppoeDk7mPKpQSN+5blfvcQmbKTHu96/+YZkmek9SxeHacef1Q+kzip0J1Bhyz/HYq9ywU0qVxnHjPSxTeKz91rya8dNdAOwKPkn9B4P8v07fLH/azgYiiC4P2GQC6nNicCmhbS1GH4jhTYto+6SpcFOXCDHcUZ1uyhAG7Xq0LXPR7OJwg8sv43FnMZJhqCARiC0VUeZsNLF7lBWiKOJR/dIQgSVgT02tJak3xfXIjGGNeNdeoUFnwIhm7Ejb2991swPborITV/tPZMlaS5J839XvMtgfhXHOibnaTupWF0eQuyUs5IPNUmesNB4sITw6kJ1KwOa9rtxnBl8raqbbThk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610c074c-ffea-45cd-2c18-08d6ceee9171
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 11:08:55.6074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3838
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
Cc: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 Aymen Sghaier <aymen.sghaier@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/1/2019 8:49 AM, Michael Ellerman wrote:=0A=
> Vakul Garg wrote:=0A=
>> In function caam_jr_dequeue(), a full memory barrier is used before=0A=
>> writing response job ring's register to signal removal of the completed=
=0A=
>> job. Therefore for writing the register, we do not need another write=0A=
>> memory barrier. Hence it is removed by replacing the call to wr_reg32()=
=0A=
>> with a newly defined function wr_reg32_relaxed().=0A=
>>=0A=
>> Signed-off-by: Vakul Garg <vakul.garg@nxp.com>=0A=
>> ---=0A=
>>  drivers/crypto/caam/jr.c   | 2 +-=0A=
>>  drivers/crypto/caam/regs.h | 8 ++++++++=0A=
>>  2 files changed, 9 insertions(+), 1 deletion(-)=0A=
>>=0A=
>> diff --git a/drivers/crypto/caam/jr.c b/drivers/crypto/caam/jr.c=0A=
>> index 4e9b3fca5627..2ce6d7d2ad72 100644=0A=
>> --- a/drivers/crypto/caam/jr.c=0A=
>> +++ b/drivers/crypto/caam/jr.c=0A=
>> @@ -266,7 +266,7 @@ static void caam_jr_dequeue(unsigned long devarg)=0A=
>>  		mb();=0A=
>>  =0A=
>>  		/* set done */=0A=
>> -		wr_reg32(&jrp->rregs->outring_rmvd, 1);=0A=
>> +		wr_reg32_relaxed(&jrp->rregs->outring_rmvd, 1);=0A=
>>  =0A=
>>  		jrp->out_ring_read_index =3D (jrp->out_ring_read_index + 1) &=0A=
>>  					   (JOBR_DEPTH - 1);=0A=
>> diff --git a/drivers/crypto/caam/regs.h b/drivers/crypto/caam/regs.h=0A=
>> index 3cd0822ea819..9e912c722e33 100644=0A=
>> --- a/drivers/crypto/caam/regs.h=0A=
>> +++ b/drivers/crypto/caam/regs.h=0A=
>> @@ -96,6 +96,14 @@ cpu_to_caam(16)=0A=
>>  cpu_to_caam(32)=0A=
>>  cpu_to_caam(64)=0A=
>>  =0A=
>> +static inline void wr_reg32_relaxed(void __iomem *reg, u32 data)=0A=
>> +{=0A=
>> +	if (caam_little_end)=0A=
>> +		writel_relaxed(data, reg);=0A=
>> +	else=0A=
>> +		writel_relaxed(cpu_to_be32(data), reg);=0A=
>> +}=0A=
When both core (PPC) and crypto engine (caam) are big endian, data ends up =
being=0A=
swapped - which is incorrect:=0A=
writel_relaxed -> writel -> __do_writel -> out_le32 -> swap=0A=
cpu_to_be32(data) -> data=0A=
=0A=
>> +=0A=
>>  static inline void wr_reg32(void __iomem *reg, u32 data)=0A=
>>  {=0A=
>>  	if (caam_little_end)=0A=
> =0A=
> This crashes on my p5020ds. Did you test on powerpc?=0A=
> =0A=
> # first bad commit: [bbfcac5ff5f26aafa51935a62eb86b6eacfe8a49] crypto: ca=
am/jr - Remove extra memory barrier during job ring dequeue=0A=
=0A=
Thanks for the report Michael.=0A=
=0A=
Any hint what would be the proper approach here - to have relaxed I/O acces=
sors=0A=
that would work both for ARM and PPC, and avoid ifdeffery etc.?=0A=
=0A=
For non-relaxed version, we used iowriteXX and iowriteXXbe - which work fin=
e on=0A=
ARM and PPC, covering all the endianness combinations (core + crypto engine=
):=0A=
=0A=
static inline void wr_reg32(void __iomem *reg, u32 data)=0A=
{=0A=
        if (caam_little_end)=0A=
                iowrite32(data, reg);=0A=
        else=0A=
                iowrite32be(data, reg);=0A=
}=0A=
=0A=
Thanks,=0A=
Horia=0A=
