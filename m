Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 446C7E42EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 07:35:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zt9N68TyzDqj1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 16:35:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.82; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="iKPguvyG"; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140082.outbound.protection.outlook.com [40.107.14.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zt7X2vwtzDqdD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 16:33:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bANNtyattuCfVFk8oXdarzoigiZc3BRwRMZxF9JyJWRW4nf3reDAtpW+wDj3+jIShsIaEfxBqo6ahkpvyKz+22NjHLa2cMNKoRmf9Ds+MPtLfewbA4ncz8c14k+Ot8ohkfeigy0p0aCgctfhlp9XPgJhXwpOlV0aX6sK9FQo3F1wPsOmnIZhhxh6eYbIYL3Tno6qZye3MzRQXzlSMHnljchXw6ul3zSa+mjVEfSLpAdwXgWdGzadgFCyZvszNOaKIcTtRJabyr0pvdxJJEwkVAWZoyuE9YPAPZDw/0uBODx6VY3wbHgccyKjUF79h4c6LjriOcwdlQJWy5XGoaxUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUBVgelz4AwMtHaj0VsEAB8Tt+bc2KN8Yn6Wk5H4+0E=;
 b=lBSkSWZOHuHB9vuaNPZJpqUVMvcZ3clqy97u4hUjd8CTjESUwWh3q1agYNlJDJhkEJTP4A8L8JfZMt7G8CmE1ZzW1YqQ0OiRxe6a0hDrTjhgAMVu7ELI2JGxFnrz6pAifH0pfjPE8X9wTDSFGqv5QwKDdnsAJ0gUIL5DDp/OR0Jf1warSCsiYiY0aoSeVXJoAFcfqirnUrQn/HhFL1pNTBt9NKdsmVWPqWwHl9eI8JiOnIlbUTV1qXLySw4rwCApr6mUDOxCGU/Gl7ffTqinSFbWnmZpM4znovk7gFftWiEGNWcCYoNBLs/ApZlvz69gv2gfCWS41Q5MlkzgR3cXAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUBVgelz4AwMtHaj0VsEAB8Tt+bc2KN8Yn6Wk5H4+0E=;
 b=iKPguvyGDRzn9PVZdJ33N96QnJCEWy8BsaAqqdPgxbqWSKOU+tlznkCg3GO+n1WpZinPVY3k4BaKoOVWpdKPoiskhN/pUrTcKSqMUAfBlXjxxxoIc7fPzPqJyYX+VElLWtjEh8pubG+OfcVA6EbG+yZ2D+JYHYaR1jx1SrNmawU=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 25 Oct 2019 05:33:17 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c%6]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 05:33:17 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: refine the setting of internal clock
 divider
Thread-Topic: [PATCH] ASoC: fsl_asrc: refine the setting of internal clock
 divider
Thread-Index: AdWK9JxJMGzwqHsSSM+MgjXQwBho3Q==
Date: Fri, 25 Oct 2019 05:33:17 +0000
Message-ID: <VE1PR04MB6479AC63FFE5D57B4E2C33D2E3650@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c541a0d-ca89-4f03-6280-08d7590cd70d
x-ms-traffictypediagnostic: VE1PR04MB6621:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VE1PR04MB66217ACEB8DBD0A20901DA64E3650@VE1PR04MB6621.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(189003)(199004)(102836004)(52536014)(76116006)(66066001)(7736002)(6506007)(6436002)(305945005)(26005)(55016002)(25786009)(2906002)(7416002)(186003)(8936002)(9686003)(6306002)(3846002)(7696005)(8676002)(1411001)(66476007)(486006)(256004)(14454004)(6116002)(5660300002)(66556008)(64756008)(66946007)(74316002)(14444005)(229853002)(81156014)(6916009)(81166006)(33656002)(478600001)(966005)(45080400002)(71190400001)(54906003)(71200400001)(4326008)(86362001)(6246003)(316002)(99286004)(476003)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6621;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pOo3QArFOPUBQPwjY1TM9LIelmVU956hvJyjyG9XDwa1e+XjiE5RPrrBYnI0oFDBRO6KeF2WZZxsDDd2wkvfBTn2g3WeD9RNQta2hGCcb2rJ+dhApv7gb9Bi5Oxw25sSCvW/yot2Jiml6njfXiIYiHfnP39EdmaLahvVueuRy9A2Xa5o9yGdebLpoNzCB3XzM/plm9WMZVKiHJfpTtWm36v7fk//Rr3P9Z5ikBABnAETYy3fNzbj3NcWBk/4sQKGA4quxcVfy0aulY80Hrhv4hRO6VvcHgqRgAgyIBQA90pQkWqjUcKiPmcqQ8MEGX0oMbwhtjAU2q074cuGGa4owDKZ3M4CwOjxcGyqRxNw2IvnM0R+JdhU++FcCl5nf2WST5qdeRwZQrnZGWqdEgG6zg7PhBTH/OLNW8P00VetcF+Cwe1gudQJWZXBm5hKjm83
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c541a0d-ca89-4f03-6280-08d7590cd70d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 05:33:17.6613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Bdj5SPVsEECrGMBWqbAdN6DQBb92uZ8Ku9JkmNDSbX38qV15glplFKw/vFHpBTJiaIfOClu2aJnxoGzzNT11Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6621
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi
>=20
> On Wed, Oct 23, 2019 at 06:25:20AM +0000, S.j. Wang wrote:
> > > On Thu, Oct 17, 2019 at 02:21:08PM +0800, Shengjiu Wang wrote:
> > > > For P2P output, the output divider should align with the output
> > > > sample
> > >
> > > I think we should avoid "P2P" (or "M2M") keyword in the mainline
> > > code as we know M2M will never get merged while somebody working
> > > with the mainline and caring about new feature might be confused.
> >
> > Ok. But we still curious that is there a way to upstream m2m?
>=20
> Hmm..I would love to see that happening. Here is an old discussion that
> you may want to take a look:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fmail
> man.alsa-project.org%2Fpipermail%2Falsa-devel%2F2014-
> May%2F076797.html&amp;data=3D02%7C01%7Cshengjiu.wang%40nxp.com%7
> Ce902d2bac4254d2faa0f08d757ecac0e%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C0%7C637074546320396681&amp;sdata=3Dbg%2BLwRQnUPhW8f
> mE972O%2F53MyVftJkK140PSnmC%2FDKQ%3D&amp;reserved=3D0
>=20
> > > It makes sense to me, yet I feel that the delay at the beginning of
> > > the audio playback might be longer as a compromise. I am okay with
> > > this decision though...
> > >
> > > > The maximum divider of asrc clock is 1024, but there is no
> > > > judgement for this limitaion in driver, which may cause the
> > > > divider setting not correct.
> > > >
> > > > For non-ideal ratio mode, the clock rate should divide the sample
> > > > rate with no remainder, and the quotient should be less than 1024.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> > > > @@ -351,7 +352,9 @@ static int fsl_asrc_config_pair(struct
> > > > fsl_asrc_pair
> > > *pair)
> > > >       /* We only have output clock for ideal ratio mode */
> > > >       clk =3D asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
> > > >
> > > > -     div[IN] =3D clk_get_rate(clk) / inrate;
> > > > +     clk_rate =3D clk_get_rate(clk);
> > >
> > > The fsl_asrc.c file has config.inclk being set to INCLK_NONE and
> > > this sets the "ideal" in this function to true. So, although we tend
> > > to not use ideal ratio setting for p2p cases, yet the input clock is
> > > still not physically connected, so we still use output clock for div[=
IN]
> calculation?
> >
> > For p2p case, it can be ideal or non-ideal.  For non-ideal, we still
> > use Output clock for div calculation.
> >
> > >
> > > I am thinking something simplier: if we decided not to use ideal
> > > ratio for "P2P", instead of adding "bool p2p" with the confusing
> > > "ideal" in this function, could we just set config.inclk to the same
> > > clock as the output one for "P2P"? By doing so, "P2P" won't go
> > > through ideal ratio mode while still having a clock rate from the out=
put
> clock for div[IN] calculation here.
> >
> > Bool p2p is to force output rate to be sample rate, no impact to ideal
> > Ratio mode.
>=20
> I just realized that the function has a bottom part for ideal mode
> exclusively -- if we treat p2p as !ideal, those configurations will be mi=
ssing.
> So you're right, should have an extra boolean variable.
>=20
> > >
> > > > +     rem[IN] =3D do_div(clk_rate, inrate);
> > > > +     div[IN] =3D (u32)clk_rate;
> > > >       if (div[IN] =3D=3D 0) {
> > >
> > > Could we check div[IN] and rem[IN] here? Like:
> > >         if (div[IN] =3D=3D 0 || div[IN] > 1024) {
> > >                 pair_err();
> > >                 goto out;
> > >         }
> > >
> > >         if (!ideal && rem[IN]) {
> > >                 pair_err();
> > >                 goto out;
> > >         }
> > >
> > > According to your commit log, I think the max-1024 limitation should
> > > be applied to all cases, not confined to "!ideal" cases right? And
> > > we should add some comments also, indicating it is limited by hardwar=
e.
> >
> > For ideal mode,  my test result is  the divider not impact the output r=
esult.
> > Which means it is ok for ideal mode even divider is not correct...
>=20
> OK.
>=20
> > >
> > > >               pair_err("failed to support input sample rate %dHz
> > > > by
> > > asrck_%x\n",
> > > >                               inrate, clk_index[ideal ? OUT :
> > > > IN]); @@
> > > > -360,11 +363,20 @@ static int fsl_asrc_config_pair(struct
> > > > fsl_asrc_pair *pair)
> > > >
> > > >       clk =3D asrc_priv->asrck_clk[clk_index[OUT]];
> > > >
> > > > -     /* Use fixed output rate for Ideal Ratio mode (INCLK_NONE) */
> > > > -     if (ideal)
> > > > -             div[OUT] =3D clk_get_rate(clk) / IDEAL_RATIO_RATE;
> > > > -     else
> > > > -             div[OUT] =3D clk_get_rate(clk) / outrate;
> > > > +     /*
> > > > +      * When P2P mode, output rate should align with the out
> samplerate.
> > > > +      * if set too high output rate, there will be lots of Overloa=
d.
> > > > +      * When M2M mode, output rate should also need to align with
> > > > + the out
> > >
> > > For this "should", do you actually mean "M2M could also"? Sorry, I'm
> > > just trying to understand everyting here, not intentionally being pic=
ky at
> words.
> > > My understanding is that we still keep the ideal ratio setting
> > > because "M2M" still uses it.
> >
> > We use IDEAL_RATIO_RATE as output rate for m2m mode, it likes a Tricky
> > operation, in order to improve the performance. I think The correct
> > operation is to use the real output rate, but the performance Is bad.
> > So it is a compromise.
>=20
> I see.
>=20
> > >
> > > > +      * samplerate, but M2M must use less time to achieve good
> > > performance.
> > > > +      */
> > > > +     clk_rate =3D clk_get_rate(clk);
> > > > +     if (p2p || !ideal) {
> > > > +             rem[OUT] =3D do_div(clk_rate, outrate);
> > > > +             div[OUT] =3D clk_rate;
> > > > +     } else {
> > > > +             rem[OUT] =3D do_div(clk_rate, IDEAL_RATIO_RATE);
> > > > +             div[OUT] =3D clk_rate;
> > > > +     }
> > > >
> > > >       if (div[OUT] =3D=3D 0) {
> > > >               pair_err("failed to support output sample rate %dHz
> > > > by asrck_%x\n", @@ -372,6 +384,16 @@ static int
> > > > fsl_asrc_config_pair(struct
> > > fsl_asrc_pair *pair)
> > > >               return -EINVAL;
> > > >       }
> > > >
> > > > +     if (!ideal && (div[IN] > 1024 || div[OUT] > 1024 ||
> > > > +                    rem[IN] !=3D 0 || rem[OUT] !=3D 0)) {
> > > > +     if (!ideal && (div[IN] > 1024 || div[OUT] > 1024 || rem[IN]
> > > > + || rem[OUT] !=3D 0)) {
> > >
> > > So for ideal =3D=3D true, these limitaions are not applied any more?
> > > Remember that the "ideal" is true for "p2p =3D=3D true" cases here.
> >
> > No, not applied.  for ideal, the div don't impact the output result
> > Even it is not accurate.
>=20
> I see.
>=20
> > >
> > > > +             pair_err("The divider can't be used for non ideal mod=
e\n");
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     /* Divider range is [1, 1024] */
> > > > +     div[IN] =3D min_t(u32, 1024, div[IN]);
> > > > +     div[OUT] =3D min_t(u32, 1024, div[OUT]);
> > >
> > > Hmm, this looks like we want to allow ideal ratio cases and p2p
> > > cases to operate any way, even if the divider wasn't within the
> > > range to get the in/out rates from the output clock?
> >
> > Yes. We still allow the p2p =3D true,  ideal =3D false.  Note that p2p =
is
> > not Equal to ideal.
>=20
> Got it.
>=20
> Overall, I feel it's better to have a naming to state the purpose of usin=
g
> ideal configurations without the IDEAL_RATIO_RATE setup.
>         bool use_ideal_rate;
> And we can put into the asrc_config structure if there's no major problem=
.
>=20

Asrc_config may exposed to user, I don't think user need to care about
The using of ideal rate or not.=20

> So the condition check for the calculation would be:
> +       if (ideal && config->use_ideal_rate)
> +               rem[OUT] =3D do_div(clk_rate, IDEAL_RATIO_RATE);
> +       else
> +               rem[OUT] =3D do_div(clk_rate, outrate);
> +       div[OUT] =3D clk_rate;
>=20
> And for that if (!ideal && div[IN]....rem[OUT]), I feel it would be clear=
 to
> have them separately, as the existing "div[IN] =3D=3D 0"
> and "div[OUT] =3D=3D 0" checks, so that we can tell users which side of t=
he
> divider is out of range and what the sample rate and clock rate are.
>=20
Do you mean need to combine this judgement with "div[IN] =3D=3D 0"
Or "div[OUT] =3D=3D 0"?

Best regards
Wang shengjiu
