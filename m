Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2AA1CEBDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 06:20:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ll3W0qK5zDqnw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 14:20:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qVLaB/gC; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LkLS4C3wzDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 13:48:45 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id y42so6537930qth.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 20:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version;
 bh=5n6oxKBMVWx60og62lkJZft41oxpnNerVi+unngwoHA=;
 b=qVLaB/gCHZnYpvyak3zXsNxqXEbCRkuc8oJhxATrqS5TqrZcJqAdG8Fc2wVgnTqJNS
 peeEYBoyICAZ95H3eIAkBiEoIxNNQ2YkLBS78lx2pEWAB6q7pdXWp2YFrYQ9RO6PSM3B
 raQJgsuVlT0Qv5uhnyCI6hSWlKqyw3BdB+YXmS+Xjmy0nQLrxKCPUxTCCv6BkiuTq3jV
 TEd9RvZvvGjQ0UgVQAJ27Nt9XlOUnZI83vvAMmp6vjFzw1WYir+F3ODrlsWrGnST2xFX
 Uz444K+iVu9X7jae/3GCuME1uARtUsUbInj6TmXzRg3nVYP7VPavuTwKBa0rUyHK+QUb
 //9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version;
 bh=5n6oxKBMVWx60og62lkJZft41oxpnNerVi+unngwoHA=;
 b=tetC7VWOpM0W0aB90o+Q1/TvtjbUTTSbuY0FKsjrg7AEPFVjBoEtHPo8mtBJH4KaO2
 fAH8fkuPGU2AsT4vHTQ/Cn6Mjtc7LyehhFoGhp4eMykgfzC4Z++kXZxSOLapI48YfFKO
 1ujQea/rNzV2gUc2rSvFjhu5SOvF9L+MAUexIw40THmRDXX1MDlvKO+srsmBdaZFjucS
 JcvMqCNV4wsKGT9w2H61lxHoXIhWbGaqTCZ25hFsrM9Jdn+I7KoYh6ZZspFza7mejv3T
 Blyg2y9oJEdW3nnGHuw+/0uNRo4Bqd3Tcr7RX2bSilM9uH3bUbNatpEhqpJdE1Nd7Dll
 7lzw==
X-Gm-Message-State: AGi0PuYYNs5gVMJ/TfXTrYs9ZHZ8VPXRWu0zwldseJc9nmZe16wrayHI
 L/OReHM/venQ+ey9jsu5+WQ=
X-Google-Smtp-Source: APiQypIHxD9o4naWzpwiO7jiQkdx1FGK6nxiI2U65jKm3mAquoGEZw8ubeU7uvcDocVVsdGPh2jGPA==
X-Received: by 2002:ac8:739a:: with SMTP id t26mr19487947qtp.311.1589255321911; 
 Mon, 11 May 2020 20:48:41 -0700 (PDT)
Received: from LeoBras (143-255-224-253.dynamic.desktop.com.br.
 [143.255.224.253])
 by smtp.gmail.com with ESMTPSA id d4sm10580366qtw.25.2020.05.11.20.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 20:48:40 -0700 (PDT)
Message-ID: <f967cab2b473406ee6427f40109c85d46b438271.camel@gmail.com>
Subject: Re: [PATCH v3 1/1] ppc/crash: Reset spinlocks during crash
From: Leonardo Bras <leobras.c@gmail.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 12 May 2020 00:48:28 -0300
In-Reply-To: <20200409002726.GA5135@blackberry>
References: <20200401000020.590447-1-leonardo@linux.ibm.com>
 <871rp6t9di.fsf@mpe.ellerman.id.au>
 <02e74be19534ab1db2f16a0c89ecb164e380c12a.camel@linux.ibm.com>
 <1585895551.7o9oa0ey62.astroid@bobo.none>
 <fb98f346a4d6a9d689ae64dae33cbd45d2f8b0df.camel@linux.ibm.com>
 <87v9majhh2.fsf@mpe.ellerman.id.au> <20200409002726.GA5135@blackberry>
Organization: IBM
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-4yilsMbkz+4cNur9Wxoo"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 May 2020 14:19:37 +1000
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
Cc: Enrico Weigelt <info@metux.net>, peterz@infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-4yilsMbkz+4cNur9Wxoo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Paul, thanks for the reply!

On Thu, 2020-04-09 at 10:27 +1000, Paul Mackerras wrote:
> On Wed, Apr 08, 2020 at 10:21:29PM +1000, Michael Ellerman wrote:
> > We should be able to just allocate the rtas_args on the stack, it's onl=
y
> > ~80 odd bytes. And then we can use rtas_call_unlocked() which doesn't
> > take the global lock.
>=20
> Do we instantiate a 64-bit RTAS these days, or is it still 32-bit?

According to LoPAR, we can use instantiate-rtas or instantiate-rtas-64.=20
It looks like we do instantiate-rtas today (grep pointed only to
prom_instantiate_rtas()).

> In the old days we had to make sure the RTAS argument buffer was
> below the 4GB point.  If that's still necessary then perhaps putting
> rtas_args inside the PACA would be the way to go.

Yes, we still need to make sure of this. I will study more about PACA
and try to implement that way.

Best regards,
Leonardo Bras

--=-4yilsMbkz+4cNur9Wxoo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQJIBAABCAAyFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl66HIwUHGxlb2JyYXMu
Y0BnbWFpbC5jb20ACgkQlQYWtz9SttQPLA//fKKlapt9WdFQ67p8gkh+h3LOaBKS
u1snYTTmKCwrvTt+MCvLADzcJRTEDOcQmfCP2qYbwOJ4eI1rwzND2NwpTZx1yVJ3
/oPkWaS8uW57rGC1cYUXYS6VxWwTYgNHSDqqV4+oqfKriuu2WuHZ93fN8C8yWxfK
EiL/DnyMCNxpuAelTuZI7SpLmbfYptqASCSHmqJNmU+SDyqxC0dCuAVsa+wutrTy
RQTtSPhSxJhGEy07wHJWwDPqFCj4s7L88JyCKpahIGszP/eodf5r90yqf4za+BzC
y+qAizOH0NhyIcCtzlMmXK3t2d6MheJgkAzmI+O02uRiAPf5x1GOOyE6aAj7qQcU
K9m+tcVIFPWry9oZVxhYWCQwwd6v4jmiIU4YvN4SD6gZxj3vWNvLbgFBwLw8PyGr
WcLccCQYhCWBhYFct7C6dC6DtBeoS6TNrMjh4nEEVTk9jeRLhI13/w06GAWlGXiP
nSfpf2VIrK/lHzCiM8kq4rg3NcVUHOewecxq0OlK3UzXEa8mkONXrcz648OErcGP
HdJq4ZHNzG7Nq7CM7EYtI0sxvcsMVanD8nSfIwxpo4SBq0fgWzZo3spiUL5QQB1L
3Db6YAZqt6MeCySwJAXnlvsHB8Nx+WasWNwhWqcsmbvDYB9xQnMWoSteaZb0yyeO
hCjbzahPdaxTPgM=
=1RoD
-----END PGP SIGNATURE-----

--=-4yilsMbkz+4cNur9Wxoo--

