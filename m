Return-Path: <linuxppc-dev+bounces-7790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E85A9381A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 15:50:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfGNb0YNlz3bsS;
	Fri, 18 Apr 2025 23:50:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744984206;
	cv=none; b=I/xcc11znHh42vQcnJ/W4xYe7n0DwrCNB0CYfa2kc0UtLTKPnv0cpSRgJSQnhFW8HFbbjM6mpCI+QTJpvLNfR+ATuSHMhSDPIrw09eqiBWLPSJK7tKTj+WQLkBCuT8Fd3HCeOZuzROlCmn95mx7qx2smj9b1lQStzXi7H9iv0moewXZ4Gz/XX8LFSi2g+Ky2dcncEXp786N67o7YK1bZ8Hzvd4Wy2bE8aYvPdJUgdd4RAtorDew37UDS4bF5k9Mzs4PB+x5v1XWcUCa0aU3DATAxLLbNBpXPMtJP625Y7I+rZBn7iUwpLsNBv0qXw/9kHYe4WNHeKkbzMDPI63osXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744984206; c=relaxed/relaxed;
	bh=fY+hDpLzJtBhDrBf6wESfqlaw9mSea9W1+P81uS8duI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULIWONcJFhT1/cHXwhtJ2rriTf5Wg4MZ5L90FSwcqecfdFYrrThzwbz+1u19gpj66w1D/g9AIIak7ASQZYVI6yrJUWQk8mJEfaqJEAAmU4OIk5lF8S8RgmUK2Ts934U+EBMSFNdNsf5enSm68MruUlc4t+sZoHjav2l8UtKWD74CKBDXabYQEWQbOudid95r5rSNJEDya2wTjwPniMEaEuMGCN1nLSLukDLyCd/O10CKXedmqXJ+iUeKnVtlJyWN2rjvi5t07J2IJYeQVaAKBT3QnfWFFZCSz3GNDOvuWD1uSaTpckks7Rw0JCUzhmh3d2DbxY/lOK86hT31V/6zTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I/Xuyeqh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I/Xuyeqh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfGNX6ySdz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 23:50:04 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5ded500589aso287926a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744984201; x=1745589001; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fY+hDpLzJtBhDrBf6wESfqlaw9mSea9W1+P81uS8duI=;
        b=I/Xuyeqh5aXlsQtIFH1bGqU/YvAwDXN3iF6eURxT0VLLMzLxhRhT3KG7nAoPyJflDB
         mKG4dZgh76SWnzUVxOL4X68774bolgE8TWT5JhK4mkpDG3j8rS+sGW8ps6ZsU83nfwgE
         Mnx1SgBkkBi7jSgASs26lY0rKhq732yu0KZ/YjPGU1r85wavUBl5GnkQqkDQ3+yii9Sn
         eZzYh9NHU3xEW5yYWxRMZ68zlPu98rrR7amf/Q+s5LqyhengamiYUW7hgI8+43L64fuy
         XpMlUvjES8Vo9Rek1O9gmC18XxE97KJTA/Esb41tXLzyoZ68R+r2unkI6k44OLuM0wOL
         v3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744984201; x=1745589001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fY+hDpLzJtBhDrBf6wESfqlaw9mSea9W1+P81uS8duI=;
        b=EEQrn/yiBWDxHXOI5nNb16VhOYrRx3WCvYu0byplReKHsf8bITzm4P/ydPXeQJhcFO
         Vesqdcfhd+jwlcytyLlMx+6NCjZCvr0mMlTu+uDQt7NGWfSXBNTmT66ho2HKLsJwQh4f
         Mq8hSHj4HYQcvS8u6z6MaVEmEXAeBUOn+tUU6N+xWCm8gBI0RmWJaoZS0i1qBgiObKGI
         U4Bv03G0VG1WeYZVm2Zf/z8RCQ6IZWk6+mbtMoglq8zUUDyA6YTsoL5SjVzZZTnOJWzE
         0MhwVueO+Chtv5KT5lFvdNg8SIoxbDFLyvtPMdnupxk5pMs/+CWDEcVU/IYjw//NZUUM
         V8ug==
X-Forwarded-Encrypted: i=1; AJvYcCVnKnRDb/5fc6lqYfSCjZ1q0s5q3isFsKqYPNpc/TxVYLeif/6U5/3WhqhsT1lGCQLmxKT+KMnpmxc01mY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/iALpaYQk4T+qu93nOkoerYPAjO61Q1fp+Tp8Eaa9BjbvEzaw
	8WsSafRBv3gHUCnPExhibiv7LI0ufs+nLDqFvo462A+XAX0cTmFL
X-Gm-Gg: ASbGncuqAHe0eAdsrPvH6d8MdqxEg4jhLVw+WE7+AKDkGkJzgS6X5vsF9TtG0VNQED0
	LSOlqY3r7EjMZYP8PngNexg2tP8IhPq4yfalPQFkfwQnmotxiiZTmj1qyvtIi4oggLfa7f6mUQB
	wbyQxDyxg7ZivStoNMGrxt5mSxnitHteE2Gv1J1dT2+/Y68VVdjPT4I39bdP7n0/PjJV6m9o9JD
	1i6fM/mQ1h4r+H39iPyQtdJTpNibAgOSwTIcIMlyRRAUQrqWSiJwpXrUaTtR4/4TQedTPl52LrZ
	13TizG4exlGdtbIAhXOg9/LOVIhI
X-Google-Smtp-Source: AGHT+IHjfpXDYgO9pT6Nw4Bezw1GjCosswQdk5p/7xF4ENGHQ2fIxqrauhJGFISGYIYBcl6ucEQa8Q==
X-Received: by 2002:a05:6402:4312:b0:5ee:497:5221 with SMTP id 4fb4d7f45d1cf-5f628628bdamr756775a12.11.1744984200603;
        Fri, 18 Apr 2025 06:50:00 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625578345sm1009703a12.28.2025.04.18.06.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:49:59 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:49:56 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250418134956.chlx2izlo6qcfzic@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
 <20250418124905.2jve2cjzrojjwmyh@skbuf>
 <PAXPR04MB8510715CEE1461C5CC8D8CC288BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510715CEE1461C5CC8D8CC288BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 18, 2025 at 01:38:31PM +0000, Wei Fang wrote:
> > Can you please add one more sentence clarifying that the LS1028A
> > management protocol has been retroactively named NTMP 1.0 and its
> > implementation is in enetc_cbdr.c and enetc_tsn.c? The driver, like new
> > NETC documentation, refers to NTMP 2.0 as simply "NTMP".
> > 
> 
> Okay, but enetc_tsn.c is only existed in downstream, so it will not be
> added here.

enetc_qos.c, sorry.

