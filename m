Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C34E6E4E4C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 18:28:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0XYB2wxSz3f51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 02:28:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=temperror header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=anMF1gf3;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=b8goBo4L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.86.73; helo=rcdn-iport-2.cisco.com; envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=temperror header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=anMF1gf3;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=selector1 header.b=b8goBo4L;
	dkim-atps=neutral
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir; Tue, 18 Apr 2023 02:27:37 AEST
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0XX90LhMz3cdn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 02:27:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=204; q=dns/txt; s=iport;
  t=1681748857; x=1682958457;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dCZa6IxFFw9MibcNSgybwVByt151nRSFqaII++MsmSk=;
  b=anMF1gf3nEHEZ5ofy/+YO+znvP4eoiNWy2DMpi40EcLLUOY28BjEU3wf
   3VdY/KtRMAEqWwAIBoMmauRgIbgcrbCi+TOliibdVJpYlH8Z7El31xFvG
   IsfqYvf/7vpKTwtmeH6e+hiEi2Trim9c0fINgTHDhRXVGxkGnbVOoBX5q
   o=;
X-IPAS-Result: =?us-ascii?q?A0BRAADYcT1kmJhdJa1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEYBQEBCwGBW1JzWykSRogeA4UuiDaSIIs8gSUDVg8BAQENAQFEBAEBhQYCh?=
 =?us-ascii?q?TsCJTYHDgECAgIBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQEeG?=
 =?us-ascii?q?QUOECeFaA2GBAEBAQMSKAYBATcBDwIBCBgeEDIlAgQOJ4Jcgl0DAaEFAYE/A?=
 =?us-ascii?q?oogeIE0gQGCCAEBBgQFnyEJFoErAZE6JxuBSUSEQD6CYgKFdIIumluBNHaBI?=
 =?us-ascii?q?A6BPIEEAgkCEWuBEAhrgXlAAg1kCw5vgUmBToFcBAIUNg4OHDcDRB1AAws7O?=
 =?us-ascii?q?j01FB8GVoEZJAUDCxUqRwQIOAYcNBECCA8SDwYmRAxCNzMTBlwBKQsOEQNNg?=
 =?us-ascii?q?UYEL4FdBgEmJKMMlhStdgqDfqBtTRODVwESjGaYX5d3gk6lKAIEAgQFAg4BA?=
 =?us-ascii?q?QaBagQvgVtwFYMiUhkPjiAZg1mPeXU9AgcLAQEDCYtFAQE?=
IronPort-PHdr: A9a23:VC/rNBCnvZwk/904PVmjUyQVoBdPi9zP1kY98JErjfdJaqu8usikN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+iLzKlBbTf73fEaauXiu9XgXExT7OxByI7H5E4jTgsCo3si5+obYZENDgz/uKb93J
 Q+9+B3YrdJewZM3M7s40BLPvnpOdqxaxHg9I1WVkle06pK7/YVo9GJbvPdJyg==
IronPort-Data: A9a23:9KI8wqsyWr/JsWKYG0esLdzHvefnVCZeMUV32f8akzHdYApBsoF/q
 tZmKWmBO62OMzf0ed1yPouy9xsGu5ODmoQxTlNq+H00H3tAgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUIYoAQgsA141IMsdoUg7wbVh3tc32YHR7z6l4
 LseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3ecldG0DFrrx8RYZWc
 QpsIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbhVq/kQPPqgH2PU0Lmpy1ROAlvVLz
 shklKCoQxUWGY/Dl7FIO/VYO3kW0axu4rTLJz20ttaeihSAeHr3yPIoB0YzVWEa0r8oWicVq
 rpJc3ZUM0rra+GemNpXTsFgj8IiIc30NasUu2prynfSCvNOrZXrH/mSvYQJhW1YasZmGfCGX
 +QaLjVWazfaZEJBZBQtKokTk7L97pX4W2QI9A3KzUYt2EDXzQpswKD1O5/Zd8KiQcROgl3eo
 XDC9m7iRBYAO7SiJSGt6HmggKrEmjn2HdtUH7yj/fksi1qWroAONPEIfRyWhKefg0ebYdRCA
 m0o4iA8ko8Q+0P+G7ERQCaEiHKDuxcdXf9ZHOs79ByBx8LoD+CxWjdsotlpNYVOiSMmedA5/
 gTWwI6xVFSDpJXQGC3NrO7Fxd+nEXFNdTdqWMMScecSDzDeTGwblBnDSJNoF7S4y4SzEjDry
 DfMpy8771nysSLp//vnlbwkq2v8znQscuLTzl+JNo5CxlggDLNJn6TytTDmAQ9ode51tGWps
 nkegNS55+sTF5yLnyHlaLxTTOj3uafVam2M3gQH83wdG9KFpiXLkWd4vW4WGauVGp1slcLBO
 RWK4loBuPe/wlP7NP4fj32N5zQClPi8SouNugH8ZdtVaZ85bx6c4CxrfiatM5PFziARfVUEE
 c7DK66EVC9CYYw+lWbeb7lGi9cDmHthrV4/sLimlXxLJ5LEOi7MIVrEWXPTBt0EAFSs+luOq
 44DZpXVlX2ykoTWO0HqzGLaFnhTRVATDpHtoMsRfemGSjeK0kl4YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:30Fq8q0fT9Q+URU+ANivPQqjBedxeYIsimQD101hICG9Lfbo7v
 xGzc5rsyMc1gxhP03IwerwT5VoIUmskKKc4eEqTMiftJGPghruEGgQ1/qV/9SGIVy5ygc979
 YlT0EaMqyJMbEUt7eI3ODVKadc/DDDytHduQ689QY1cegJUdAT0+4RMG/yeScaKGYpZPpJd+
 v/l7E33QZIO05nG/hTbUN1IdQr0ue75K4OFiR2diLPhjP+8Q9AwYSKWyRw2C1uNw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDLNbksLlPFhzcziKTIKhxUbyLuz445Mu17kwxrd
 XKqxA8e+xu9nLqeH2vqxeF4Xi77N9u0Q6+9baruwq9nSXLfkNlNyOHv/MJTvLt0Tt9gDi76t
 Ma44vWjesFMfqKplW12zGBbWAgqqPzmwt7rQbW5EYvBLf3r9Rq3N4i1VIQH5EaEC3g7oc7VO
 FoEcHH/f5TNUiXdnbDowBUsZ+Rt1kIb1a7q3I5y4yo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4XY46MI6KI32IRQiJPHOZIFzhGq1CM3XRq4Tv6LFw4O2xYpQHwJY7hZ
 yEWlJFsmw5fV7oFKS1rd922wGIRH/4USXmy8lY6ZQ8srrgRKDzOSnGU1wqm9vImYRQPiQaYY
 f9BHt7OY6uEYK1I/cC4+TXYegeFUUj
X-Talos-CUID: 9a23:6sIYrG8B78cUp7qIemiVvwk5P54De3T49nHNCm6EEWx7d5q3RlDFrQ==
X-Talos-MUID: 9a23:D1M43wo9dtLpE0kNm6MezzVkbP9G4OOhMUcui5JZtZfHDw5rFjjI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 17 Apr 2023 16:24:20 +0000
Received: from rcdn-opgw-4.cisco.com (rcdn-opgw-4.cisco.com [72.163.7.165])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 33HGOKpk003066
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 16:24:20 GMT
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:24:20 +0000
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:24:20 +0000
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:24:20 +0000
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:24:20 +0000
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:24:20 +0000
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:24:20 +0000
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:24:20 +0000
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:24:20 +0000
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
  by rcdn-opgw-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 16:24:20 +0000
Authentication-Results: rcdn-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=danielwa@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="5.99,204,1677542400"; 
   d="scan'";a="237999"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmCwtsZjmlrxRwxvmwO6oC+fpZMOsmxJ9yJ3gn0FJaXy9lI4txb1GpQEj2Jr92yUxDjaQ8QPfTNVzcyc+Ji6TUSzSaLz0DMoVLIMaLIU6X8OJ5967qV7y72ZousnRiQfvY4oCHreCF8ix52Jy0P8/iA/fi+Egq9iQaxmkVkY1rezrKKjGSVgE0OLtFI0PKB6Jsj+iNFQIQliTo4W99GRUOstW2qSSnvATJE7zLuoJSXAO/3d/FfdTj3v/9DUfpe7jM/WdTFJJRzq43D0lUpuJ3LTNYGoP6RlZlzvFaj/DfzERlBo3jyzV1n7vwL/L8ZCXSPYkHZTrHhDt614k6EhfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCZa6IxFFw9MibcNSgybwVByt151nRSFqaII++MsmSk=;
 b=kf9so+XIX8Se/itDlIvLkVUjexMHZCJKHpnHnnmNVVvVaBp/PCV+sbn5aaLyZvioTUR5m1bPEQo6L2pXD7wC5vEJZKMR75r2ViAGOHBjNg1eDsKphtTievI5COHnvpdtxAl4kyE6WOFEvBfM4m6VeC9T7xvvy7Lg9GSdjFZjQFfHHB4idN5QFe5dpqlFZaf1gb7h1zprSyubULbWAuOpsJ3i0CgQzM69xfajuV5zei7sxFfp+z/mOZeGOpKMmXg6RDQK/RVK78BNty/X07D51HtFicH83V78ZYd5Y4uznfSN+f3nMj/Pw1OyNE0FmeThIIoCtZ5E8xao7gwV3hnIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCZa6IxFFw9MibcNSgybwVByt151nRSFqaII++MsmSk=;
 b=b8goBo4LtLJwG/C7du/WyVyuID3kGoASyiVTxpLn+g1GLoYPMDsyh7mCeY/dScfxhGB5kFzeDXEP3Sf6rdkj+cpAIRU7ak2cjS2qu7YmRCvWJshL1RSYs4RMPgZ+bsZHtfyDWV4bl/ex38PUZ+8PjBEc6eiYRQc6itIVxuxvovE=
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com (2603:10b6:a03:422::15)
 by CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 16:24:17 +0000
Received: from SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::66a3:de62:35f4:ad97]) by SJ0PR11MB5790.namprd11.prod.outlook.com
 ([fe80::66a3:de62:35f4:ad97%6]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 16:24:17 +0000
From: "Daniel Walker (danielwa)" <danielwa@cisco.com>
To: Tomas Mudrunka <tomas.mudrunka@gmail.com>
Subject: Re: [PATCH 1/4] add generic builtin command line
Thread-Topic: [PATCH 1/4] add generic builtin command line
Thread-Index: AQHZcUkOD6ppc7o7REqMkKuIthkl5Q==
Date: Mon, 17 Apr 2023 16:24:16 +0000
Message-ID: <20230417162415.GF1391488@zorba>
References: <20190319232448.45964-2-danielwa@cisco.com>
 <20230417161818.2002082-1-tomas.mudrunka@gmail.com>
In-Reply-To: <20230417161818.2002082-1-tomas.mudrunka@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5790:EE_|CH3PR11MB7201:EE_
x-ms-office365-filtering-correlation-id: 4cfc4be6-55f8-4203-9a98-08db3f603097
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  q8mQhRQVLghGKd/wH8NYUjSGCfi0dNw8XC08Au6DqC5rCNVBx4weTW5+z8tVWJls0hgHLBI7elhXsIZ7gTebUPO9SZmlSfcj38GbZBrJ317DGdWGySiYRZN/KLtt1U56jNfleZxwgB88XtfDZ475DI0EnrQ/UBAN6tIGIzqR0DyFeY7cmSAJYM68JlkJnepaX2F3kvxBJCubsBHFtxH41CRVYS5JYC9+TDzB1XUudM1A4OoGj6nzJ7Q3HlKym+i830r5GUP+Cm6IYtAgJcGopd+vEedf2fc+U6ZYLn+gjKmNylAe2XN8oMR/tcND7y6O2bNPogy6tAm4qV3umUf2aNp7IXprjt9zg9yA3GTPYQb+hERLdqlESh3P270uyAHFbAm2ksKwwnH+alzy2BBmLTJInfmfJ8PSAvkIkjvQbEflC5gUg2V3BtJEtp4T+Zv25NXV4vzQEvfxBF6y8fdWOLWNKiVlyh5BpOEVw6ku6Mz92ZjIPLc+oswZ3Ue9erj6ocWpm2sJmNf+S68e3BZH/vXqA6vRpSDphWkP5TCPIaAS0yQnGHSkKkzThYDBQ4sDjd7XR2NLmphmUbtk+a4jXEQ5qNSeB4eCip6nVzSXY0iRISKOyujjCc2FP3CtROyqeLw/JU/4/B92BLAHas1zIg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5790.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199021)(6486002)(478600001)(86362001)(71200400001)(558084003)(26005)(83380400001)(33656002)(107886003)(6506007)(186003)(6512007)(9686003)(1076003)(38100700002)(38070700005)(122000001)(33716001)(64756008)(6916009)(76116006)(66446008)(66946007)(66476007)(66556008)(316002)(2906002)(4326008)(8936002)(5660300002)(8676002)(41300700001)(54906003)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?tlmGXlvfmrI/RoC+yvY9p+QZ6Wqd2bdbE9HM4wWfZ6DqVsBp/dD0mMBzohk8?=
 =?us-ascii?Q?10aQyxbkUG5eFyydMzmXbRFNuG/0j6AICpTYdn4iW8MViN2D6wF4GkQSMpMh?=
 =?us-ascii?Q?OZ6tVH/ZP8YKIg+GvmZpWHHYK9xNlormSvbmK0Rf1hFw9ddnI28XZW4buWuY?=
 =?us-ascii?Q?gKsqYlH7WYFDjSJYNRDODVYr2QmC+a0kG7sxWuDaHHDXk2Zq6nvG4o1v5tVJ?=
 =?us-ascii?Q?qD5earixYaGb7HV/Q0S81DU/3Rn4iL8p5Q+N3/DUHhRx9xy+vNi5SBV0iZb7?=
 =?us-ascii?Q?C/omLKiDArPWN/ztGoUk9v/ofU5nzw1wI+/Qw10oMFX0BLAb1duf/QMdun+q?=
 =?us-ascii?Q?kMFStAmbeVdyFmQ3iv6KQPLSjA9iY3LfbyIicbfDFiYF6tGl8UNH1EzmnEel?=
 =?us-ascii?Q?ERu4uniGUaGOeQTnT7yA4q2qcy7iozVT1WhJ0XxoEyh3YIwuXyoO/vVErdo0?=
 =?us-ascii?Q?1DJ+R0kz8VfHxKTnx/oLUsrhncsCNfwkNFp7CNJZQscmr18RqdiRsM/07Ig5?=
 =?us-ascii?Q?N7Ai3PSHboQMAej0hEjZmdLtxrBX9JWD6neQrqrQ9/XHnE91YPC6VwNJ/cjr?=
 =?us-ascii?Q?Zdg/lk6HtGpnUdQewlOJXy8DOgYC91A/L/aXc9t3QeMMtloH/lYnH4YUU52V?=
 =?us-ascii?Q?pxDjmrNrJ8PeboGLawsJZeIG8PD+wtt5hZB5WsZ3KiYY3GncoKdtkVwjlc4p?=
 =?us-ascii?Q?CITvHiQkDthwKYs7AczEHCyy+1elUW7UQyPRsvbtuQdS68PpDTWMMGLVEBRK?=
 =?us-ascii?Q?Vz+F4UiSHixUQLiV4MRLu8OhjUioZhehqYhxF9X4POcaqBdTKL4Pw/Xsejk4?=
 =?us-ascii?Q?C3Fj9eL7Ca6Mz39bfeqX5dXKwTiQs9V3VSaIRg4yAPJQbKywvjdSD9Ds9QRt?=
 =?us-ascii?Q?uMGi09Vu9yqViXEqKdp5TwXxoMjex0MsY/2+V8rRsmiRMZYXGeSJ3+CMEfTu?=
 =?us-ascii?Q?evms0QWKdTysNfP2QExXc4T9YLbh4KNINW/WNLigMUtj1szUUODytI+SClgM?=
 =?us-ascii?Q?chJDuvVoRY/642+L9DE7+sPX+5H51kjN3ygqAJzKp7yz2MleONKnwf8hlOPw?=
 =?us-ascii?Q?hRvrL2JJVRqIH0HgTbxQyOyVpAiZupdVUaPoD+s303PpC2LdN0mWqEsnpNyA?=
 =?us-ascii?Q?K7NIG8gFHaRk0p+7EJqGwCszvUaOpRbuZ+sPNkS677dMie7XRtE52HVpl5Fa?=
 =?us-ascii?Q?KCKh419jLJOJGXkVbDgmfqasVlQ6C3U9bIkLdJ1no0DpS9BGTsZq8sPKXrVr?=
 =?us-ascii?Q?r2eIgpHa0aJsGxhgnrDatYfbGGsxKAJZ1A75Ls5gEmj5QDNnZYI0NOBXUl6P?=
 =?us-ascii?Q?Dwk4Kmr9qoqZn+crBor3Fyd0fM5+gxSad8MwdTfZ4T6cX3OqEEeh47Q1/AHb?=
 =?us-ascii?Q?9+i7W+G3+Nj0orcsugLtV7MkoGOVujvAgXd4HInQKfvrmdun1D9y3x19hAJa?=
 =?us-ascii?Q?pfShxXLYQ0mjfA1LSQBI46ToOuAuvBoPsOMx9s69Yw2Y/PYApgTetRQkI4MB?=
 =?us-ascii?Q?vgDVZpqK5BRFidaOmlh8Eei6PgjH2GnLVCIxv8qLUl9d7fgXRSycVDQBG5/M?=
 =?us-ascii?Q?zxHpALiql/dzq7hedgThFD8XBHw/38hZ2PeBrT77ZMS4eTkk9CL35ss1B5Ro?=
 =?us-ascii?Q?+Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4BBE78A48344874283E8B1EE5EC9FE58@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5790.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfc4be6-55f8-4203-9a98-08db3f603097
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 16:24:16.7337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KAoVtIGQw0jsRlcOjC3NhdZmONWOIoWBCP8sjUtxGQ7WIOL4Dc30xfQxP6vAyF8tbQUSgTozYhpeEjTUgJMcbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
X-Outbound-SMTP-Client: 72.163.7.165, rcdn-opgw-4.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
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
Cc: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "maksym.kokhan@globallogic.com" <maksym.kokhan@globallogic.com>, "dwalker@fifo99.com" <dwalker@fifo99.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 17, 2023 at 06:18:18PM +0200, Tomas Mudrunka wrote:
> This seems quite useful. Can you please merge it?

I need to re-send it before it can be merge. I'll try to update it soon.

Daniel
