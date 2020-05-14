Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4B91D3EF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 22:24:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NNLK4pKRzDqyP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 06:24:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gcYhIWBa; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NNJS6bMKzDqvV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 06:22:46 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id g185so238870qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version;
 bh=8SQfuyaOZCvYd3/hde0Ei4fxfgVmOiAcZ6vRF2d2JVE=;
 b=gcYhIWBaR1AtQHmn73GDdqf4cmf06P2RorZZ+lJaHkQvztImOUbI1C3E6Puqu6QxbK
 7baCEyHpUEcrWmU5ArIf11t0b/ueGsaNMpb5vlGMReUostX5qqUCVJ2p2Ym+5tG4JPiZ
 Ilqp+aTsG/+xF+K0yIo7W+tOES2qnQkw8QXyjUEhcp2cu5FxG8ayztFUwlVNcz4ChylJ
 sAElY2aLOQN06fHcMhOOZ1lI39o85P0hn8zI71rvhBmlOHcEMNl/UFEOIJ4ykPsa0+DW
 2OAoNetAOp6DtBDRwyWBSSbstkYEkkV+Yd2b7xMpOtLMqwLZfBpwoL7X97D+Hkziouwy
 vV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version;
 bh=8SQfuyaOZCvYd3/hde0Ei4fxfgVmOiAcZ6vRF2d2JVE=;
 b=oT6wYuyk053E0AnuWXKWC50m/dF27yt8BHqlHYLH8ve0CAbMZNnw1ugdc7VjL8Do0W
 ifKtAz4hyEM8DWpyA4Q42OuFBiDa+1bdwAZxE5Zz5kaCQS43S5M7oLyjTxCngk9npxPq
 yjdROW2JDaY1Bef/kvqWa81W6guZYGBH3SMMe1L6/yPLdsyYnuwsiq1AJI/2pxQm5R0x
 ZlEb5bquwn0sgWPcJjiagkEa9ceUaY4ttlVE4UVOYlwjobc6aekOdd/JEZxyZgXP3RkA
 JQa416W6SZJJZymmPBaD7f608UEs1pp6vJ0fv5hOwGYKfEqtJVbo3WiDNd1WKORw+S8n
 LlWA==
X-Gm-Message-State: AOAM533VXcRFWhB5fUWQNtT9W1D1VGtiw7cVoQiL7gWyJvKiPEh/V7Lk
 ChYUBHNeErIzYfYDYEZjofM=
X-Google-Smtp-Source: ABdhPJzU+tYb9m69rF7oG6STN0UmKcUTKGXF3ue8PYs+Pz4IZ+fPFF6AbRmFYnY6ysKWucTlMen1vg==
X-Received: by 2002:a37:4b4f:: with SMTP id y76mr145366qka.292.1589487762952; 
 Thu, 14 May 2020 13:22:42 -0700 (PDT)
Received: from LeoBras (179-125-143-209.dynamic.desktop.com.br.
 [179.125.143.209])
 by smtp.gmail.com with ESMTPSA id g66sm3348344qkb.122.2020.05.14.13.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 13:22:41 -0700 (PDT)
Message-ID: <251d086383fc5a94a5f9dc7c348339413f705458.camel@gmail.com>
Subject: Re: [PATCH 1/1] powerpc/rtas: Implement reentrant rtas call
From: Leonardo Bras <leobras.c@gmail.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Date: Thu, 14 May 2020 17:22:26 -0300
In-Reply-To: <875zcy2v8o.fsf@linux.ibm.com>
References: <20200408223901.760733-1-leonardo@linux.ibm.com>
 <87ftdb87jf.fsf@linux.ibm.com>
 <ba97d52df60ac9c4a4afc2c03121a8c263aa5a15.camel@linux.ibm.com>
 <875zcy2v8o.fsf@linux.ibm.com>
Organization: IBM
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-EPXKkKrztE/RJuZN2zTS"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Nadav Amit <namit@vmware.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-EPXKkKrztE/RJuZN2zTS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-05-14 at 14:04 -0500, Nathan Lynch wrote:
> I checked with partition firmware development and these calls can be
> used concurrently with arbitrary other RTAS calls, which confirms your
> interpretation. Thanks for bearing with me.

I was not aware of how I could get this information.=20
It was of great help!

Thank you for your contribution!

--=-EPXKkKrztE/RJuZN2zTS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQJIBAABCAAyFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl69qIIUHGxlb2JyYXMu
Y0BnbWFpbC5jb20ACgkQlQYWtz9SttT40g//RNI2FQvkeWJdspK33RxnVszosgPu
Lk03U8D3Ca/7opCRu9imULxme2ZKN9fhdMuDTEVTZ/C6ePnvjZzW7nTsR+a9PPvf
poRp1ax1tO9MUKpvgTYp2B90juREk/QXG6zlkRqX8DXtpYvTUP8V5eaTu2caDux0
nUaidimSlHC91rBNy8RIcDUbYK528eqSy0NGDO1Ne6vnx8+Nldia8m7wEZ1phfbi
+2HkT6pPBLdBNz99u5tyoRMwst/oYpXyZxn76dIN1YfDWMr1MvykORh2L1U00Bi1
F+mc37I59b7qjMoaPaLIdUe0xHHld3LWnTy8QzAl3Bc38HU1tr7ArZbtqKEk13ra
za+NI3BUFp/kWCjnc3gS/YFIEvHQFSytI1b9MGVtfek6a5VaGMzndbqD+Jq7Oxb3
Lajb28yhcsWClaNt/9Ahh5cV2wEQFq/+BMpzIt0xHu1XOsrKzF8IgK5VZgJynnew
Z5anm6d1v1sv8A1S4morQgeNTVHWt5UPGkUuNLHTst8lCw/ZxZ3f5C1vSAC/+JD/
qFNShRviePOrW2Lhcw4PJ/6MHIVFhBkI/PA1FvDBO6ikB+9dyheim4dt6Khqa7CE
tWmEdPtQvUGahm9pitZaSrDtDcEhh6hKgjfQ2oYgUuy4zWpWj3khldRfOZ4Yj5nw
mERoUCtRtutfCT4=
=FQdj
-----END PGP SIGNATURE-----

--=-EPXKkKrztE/RJuZN2zTS--

