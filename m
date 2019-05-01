Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3407010B47
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 18:24:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vNxz6gb9zDqPM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 02:24:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.72; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=vakul.garg@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="smsggbm3"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130072.outbound.protection.outlook.com [40.107.13.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vLMy0cQrzDqGL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 00:27:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLkBggoh9yDUxCWnuRcQwnw0HDV4qQ9XSqN5HfUDIxM=;
 b=smsggbm37/ioy2BxnuMIUDCdN2GKEN4LXsnptU01mVgZIKD2e9xy+0AZwZ0HthLcvQxiKLzLgOpF3xAWtIiHaOVwNkRZiH6VZyV97IbILzI9WYF/pN1P7XPXp89/tF0cbaj7NgT6ccVcDrmlHXQp4voMpduB6+/fSz2u9D2hGiY=
Received: from VE1PR04MB6670.eurprd04.prod.outlook.com (20.179.235.142) by
 VE1PR04MB6653.eurprd04.prod.outlook.com (20.179.235.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Wed, 1 May 2019 14:27:50 +0000
Received: from VE1PR04MB6670.eurprd04.prod.outlook.com
 ([fe80::812f:13f4:8c9d:86d1]) by VE1PR04MB6670.eurprd04.prod.outlook.com
 ([fe80::812f:13f4:8c9d:86d1%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 14:27:50 +0000
From: Vakul Garg <vakul.garg@nxp.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: RE: [PATCH] crypto: caam/jr - Remove extra memory barrier during job
 ring dequeue
Thread-Topic: [PATCH] crypto: caam/jr - Remove extra memory barrier during job
 ring dequeue
Thread-Index: AQHU/+Gzv+Y38InnM0Kq/zT05vR1yaZWU1kQ
Date: Wed, 1 May 2019 14:27:50 +0000
Message-ID: <VE1PR04MB667093258EC804912EFAE6A18B3B0@VE1PR04MB6670.eurprd04.prod.outlook.com>
References: 20190409063505.16664-1-vakul.garg@nxp.com
 <87pnp2aflz.fsf@concordia.ellerman.id.au>
In-Reply-To: <87pnp2aflz.fsf@concordia.ellerman.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vakul.garg@nxp.com; 
x-originating-ip: [160.202.37.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a0fec6e-32ce-4c35-ae98-08d6ce4130a9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6653; 
x-ms-traffictypediagnostic: VE1PR04MB6653:
x-microsoft-antispam-prvs: <VE1PR04MB66535A55D1D08E1B176EAAA08B3B0@VE1PR04MB6653.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:156;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(199004)(189003)(13464003)(76116006)(33656002)(99286004)(76176011)(14454004)(8676002)(14444005)(54906003)(66066001)(6116002)(7696005)(66946007)(66556008)(256004)(3846002)(66446008)(73956011)(64756008)(102836004)(316002)(476003)(6506007)(446003)(186003)(2906002)(486006)(71200400001)(53546011)(26005)(86362001)(55016002)(11346002)(5660300002)(66476007)(71190400001)(305945005)(4326008)(45080400002)(9686003)(81156014)(25786009)(44832011)(6246003)(68736007)(53936002)(81166006)(229853002)(6916009)(6436002)(74316002)(478600001)(7736002)(52536014)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6653;
 H:VE1PR04MB6670.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uDrrfRmcNNBBysjasiHsBSfk4VEtRfAzBRvKpoNxFN+xkr0PBZIFkwa1JIgNxzoQweIYoLV0iTQHK/Dvblu9/sz/dycjoNTmQPa1RwHF9zYI73RFV+Z2RT02TzH1Pdn4rlEdW4H0eBGw0l5Sg0S4QngIX01V6LGxyOrDErBL6V3pOOeSMZjqrVUHMEDVqnPK9Jh2SQykyqW/ywZUD67q6fHNg2KrqtO9WYCWyVwM59w54GGO4QrXr3ldlL3iaICdMiAt2us0rSrouEwN9Bo9aBmPg3EWED+GSk7ow9yTHHbyLmN40WwS3x4C81+ofM0IRM7rUMUrBmekaFHirOkYDSx+IU6gqUKRfWNc3t/p3OorKTXF6dI5cVcMzMcy1zde2kYavoaBi83u5bkrDrVVNO3JDR/SKTppSMTjLa+KpWA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0fec6e-32ce-4c35-ae98-08d6ce4130a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 14:27:50.3576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6653
X-Mailman-Approved-At: Thu, 02 May 2019 02:22:51 +1000
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
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 Horia Geanta <horia.geanta@nxp.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Michael Ellerman <mpe@ellerman.id.au>
> Sent: Wednesday, May 1, 2019 11:20 AM
> To: Vakul Garg <vakul.garg@nxp.com>
> Cc: linux-crypto@vger.kernel.org; Aymen Sghaier
> <aymen.sghaier@nxp.com>; davem@davemloft.net;
> herbert@gondor.apana.org.au; Horia Geanta <horia.geanta@nxp.com>;
> linuxppc-dev@lists.ozlabs.org
> Subject: Re: [PATCH] crypto: caam/jr - Remove extra memory barrier during
> job ring dequeue
>=20
> Vakul Garg wrote:
> > In function caam_jr_dequeue(), a full memory barrier is used before
> > writing response job ring's register to signal removal of the
> > completed job. Therefore for writing the register, we do not need
> > another write memory barrier. Hence it is removed by replacing the
> > call to wr_reg32() with a newly defined function wr_reg32_relaxed().
> >
> > Signed-off-by: Vakul Garg <vakul.garg@nxp.com>
> > ---
> >  drivers/crypto/caam/jr.c   | 2 +-
> >  drivers/crypto/caam/regs.h | 8 ++++++++
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/crypto/caam/jr.c b/drivers/crypto/caam/jr.c index
> > 4e9b3fca5627..2ce6d7d2ad72 100644
> > --- a/drivers/crypto/caam/jr.c
> > +++ b/drivers/crypto/caam/jr.c
> > @@ -266,7 +266,7 @@ static void caam_jr_dequeue(unsigned long
> devarg)
> >  		mb();
> >
> >  		/* set done */
> > -		wr_reg32(&jrp->rregs->outring_rmvd, 1);
> > +		wr_reg32_relaxed(&jrp->rregs->outring_rmvd, 1);
> >
> >  		jrp->out_ring_read_index =3D (jrp->out_ring_read_index + 1) &
> >  					   (JOBR_DEPTH - 1);
> > diff --git a/drivers/crypto/caam/regs.h b/drivers/crypto/caam/regs.h
> > index 3cd0822ea819..9e912c722e33 100644
> > --- a/drivers/crypto/caam/regs.h
> > +++ b/drivers/crypto/caam/regs.h
> > @@ -96,6 +96,14 @@ cpu_to_caam(16)
> >  cpu_to_caam(32)
> >  cpu_to_caam(64)
> >
> > +static inline void wr_reg32_relaxed(void __iomem *reg, u32 data) {
> > +	if (caam_little_end)
> > +		writel_relaxed(data, reg);
> > +	else
> > +		writel_relaxed(cpu_to_be32(data), reg); }
> > +
> >  static inline void wr_reg32(void __iomem *reg, u32 data)  {
> >  	if (caam_little_end)
>=20
> This crashes on my p5020ds. Did you test on powerpc?
>=20
I did not test on powerpc.

> # first bad commit: [bbfcac5ff5f26aafa51935a62eb86b6eacfe8a49] crypto:
> caam/jr - Remove extra memory barrier during job ring dequeue
>=20
> Log:
>=20
>   ------------[ cut here ]------------
>   kernel BUG at drivers/crypto/caam/jr.c:191!
>   Oops: Exception in kernel mode, sig: 5 [#1]
>   BE PAGE_SIZE=3D4K SMP NR_CPUS=3D24 CoreNet Generic
>   Modules linked in:
>   CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.1.0-rc1-gcc-8.2.0-00060-
> gbbfcac5ff5f2 #31
>   NIP:  c00000000079d704 LR: c00000000079d498 CTR: c000000000086914
>   REGS: c0000000fffc7970 TRAP: 0700   Not tainted  (5.1.0-rc1-gcc-8.2.0-
> 00060-gbbfcac5ff5f2)
>   MSR:  0000000080029000 <CE,EE,ME>  CR: 28008484  XER: 00000000
>   IRQMASK: 0
>   GPR00: c00000000079d6b0 c0000000fffc7c00 c000000000fbc800
> 0000000000000001
>   GPR04: 000000007e080080 000000000000ffc0 0000000000000001
> 00000000000067d7
>   GPR08: 00000000880401a9 0000000000000000 0000000000000001
> 00000000fa83b2da
>   GPR12: 0000000028008224 c00000003ffff800 c000000000fc20b0
> 0000000000000100
>   GPR16: 8920f09520bea117 c000000000def480 0000000000000000
> 0000000000000001
>   GPR20: c000000000fc3940 c0000000f3537e18 0000000000000001
> c000000001026cc5
>   GPR24: 0000000000000001 c0000000f3328000 0000000000000001
> c0000000f3451010
>   GPR28: 0000000000000000 0000000000000001 0000000000000000
> 0000000000000000
>   NIP [c00000000079d704] .caam_jr_dequeue+0x2f0/0x410
>   LR [c00000000079d498] .caam_jr_dequeue+0x84/0x410
>   Call Trace:
>   [c0000000fffc7c00] [c00000000079d6b0] .caam_jr_dequeue+0x29c/0x410
> (unreliable)
>   [c0000000fffc7cd0] [c00000000004fef0]
> .tasklet_action_common.isra.3+0xac/0x180
>   [c0000000fffc7d80] [c000000000a2f99c] .__do_softirq+0x174/0x3f8
>   [c0000000fffc7e90] [c00000000004fb94] .irq_exit+0xc4/0xdc
>   [c0000000fffc7f00] [c000000000007348] .__do_irq+0x8c/0x1b0
>   [c0000000fffc7f90] [c0000000000150c4] .call_do_irq+0x14/0x24
>   [c0000000f3137930] [c0000000000074e4] .do_IRQ+0x78/0xd4
>   [c0000000f31379c0] [c000000000019998]
> exc_0x500_common+0xfc/0x100
>   --- interrupt: 501 at .book3e_idle+0x24/0x5c
>       LR =3D .book3e_idle+0x24/0x5c
>   [c0000000f3137cc0] [c00000000000a6a4] .arch_cpu_idle+0x34/0xa0
> (unreliable)
>   [c0000000f3137d30] [c000000000a2f2e8] .default_idle_call+0x5c/0x70
>   [c0000000f3137da0] [c000000000084210] .do_idle+0x1b0/0x1f4
>   [c0000000f3137e40] [c000000000084434] .cpu_startup_entry+0x28/0x30
>   [c0000000f3137eb0] [c000000000021538] .start_secondary+0x59c/0x5b0
>   [c0000000f3137f90] [c00000000000045c]
> start_secondary_prolog+0x10/0x14
>   Instruction dump:
>   7d284a14 e9290018 2fa90000 40de001c 3bbd0001 57bd05fe 7d3db050
> 712901ff
>   7fbd07b4 40e2ffcc 93b500dc 4bffff94 <0fe00000> 78890022 79270020
> 41d600ec
>   ---[ end trace 7bedbdf37a95ab35 ]---
>=20
> That's hitting:
>=20
> 		/* we should never fail to find a matching descriptor */
> 		BUG_ON(CIRC_CNT(head, tail + i, JOBR_DEPTH) <=3D 0);
>=20

Is it hitting under high traffic to caam?
How to reproduce it?
=20

> cheers
