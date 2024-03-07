Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D376A875341
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 16:35:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=hGYsH7Aw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrD0T4GDwz3vXc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 02:35:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=hGYsH7Aw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrCzl2Pfsz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 02:35:12 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a293f2280c7so180786066b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Mar 2024 07:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1709825707; x=1710430507; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQBkiWXTggIKvHEMWEiGOum5TT7ceiwVi4duUGHOdgY=;
        b=hGYsH7Aw6U56oRo/2kRJDKWfQx2ky0X4l5R2YOsgoq5IC3trBUx9qOTlIvCp+qUDE8
         XkWdGebxwA0dw1tHN5InKa4vFPTw85IMp+EAmUZtso7sxZoLrzk4ifxmoeg7fxvFSXR+
         Hbw5dWkRXTOjik4gn6GHlLvuNNzTUs2DvMBlMSjge9nT1tsOIs62U6fbtXePfk8AjJtB
         pvpVPLJQ+BXqYWQo7X09R894ERqy+g15cU26A2NxxlsurpTeQpkBGtGLm5mPjm+RgW+Y
         lXGHzHGMZoM7YmKPxdTdfUxQXc2bDXrgoPL9TrbtRzUN9GcsEHyPcj1/0KIgfylkdrKA
         DCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709825707; x=1710430507;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQBkiWXTggIKvHEMWEiGOum5TT7ceiwVi4duUGHOdgY=;
        b=H/JBFGtBMJn6ZGDw81+CkbHATeUdfSHmcIGhlqWMLTrNqou4hoZsfACBfXvHKEHOG6
         9lHk2Z6vNpxDJhMb7nFO9+EG5XAedLx9VRDXahr6pXZ86WxZYDegNNFX65qBjNdGYX3y
         FsjWRJalD0ymYMyh2di0s4DH+O0SsLpzZYnTAJTdSws4KMGi7Anc9aNv5nY8u/zQomxj
         yPyuGV/K4wI3PFiPgdmdqlxeH3tFYbdMIZ1yEYdWEVuhOtVbOL4NxKAWb6iI+pn+dfgg
         ANcmyHQ1ogtZguAxn7HEC0ks3LIWuv+YiudQuM6uuBdbWxVws4OzOldryU0Bf8U7yRTN
         toUw==
X-Forwarded-Encrypted: i=1; AJvYcCVDqbNTc03WovW4+eCLkNUdG/4Z+p5InKrsCZB/Q22v+6zG71wlfHxeKD8bhUib4PeIPWuNLBrCeMLOu7ilzW/iXW0tmqWHx1t2chcHrw==
X-Gm-Message-State: AOJu0Yxt1sDpj0RVAejX2KuhUjbElVdeCPcHUgJiBpvz8TRq5Z+muYUG
	GA4B6WU8/V+jL6yLCYcqYGnpbC172Nlg1R1eSV89mMkQkNr2iZFO1Pv3QfY0x1I=
X-Google-Smtp-Source: AGHT+IFZFPN298xxejGvRyvzbp276Z/iMmAVyPkxVHpe9zUTmo8gWkPUve5gZl3bDKcFPppBDzmd1g==
X-Received: by 2002:a17:906:6a89:b0:a45:902b:3cb0 with SMTP id p9-20020a1709066a8900b00a45902b3cb0mr6729129ejr.58.1709825706741;
        Thu, 07 Mar 2024 07:35:06 -0800 (PST)
Received: from smtpclient.apple ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id lz19-20020a170906fb1300b00a45b7f9e822sm1973422ejb.118.2024.03.07.07.35.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Mar 2024 07:35:06 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v5 4/6] MAINTAINERS: add entry for DCP-based trusted keys
From: David Gstir <david@sigma-star.at>
In-Reply-To: <CZLBYPUU992Q.2PRCZBFNZYWY6@suppilovahvero>
Date: Thu, 7 Mar 2024 16:34:53 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <2E9B3F32-B162-4C84-81AD-5713EB53A85D@sigma-star.at>
References: <20231215110639.45522-1-david@sigma-star.at>
 <20231215110639.45522-5-david@sigma-star.at>
 <CZLBYPUU992Q.2PRCZBFNZYWY6@suppilovahvero>
To: Jarkko Sakkinen <jarkko@kernel.org>
X-Mailer: Apple Mail (2.3774.400.31)
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, Paul Moore <paul@paul-moore.com>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kern
 el.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jarkko,

> On 04.03.2024, at 23:48, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>=20
> On Fri Dec 15, 2023 at 1:06 PM EET, David Gstir wrote:
>> This covers trusted keys backed by NXP's DCP (Data Co-Processor) chip
>> found in smaller i.MX SoCs.
>>=20
>> Signed-off-by: David Gstir <david@sigma-star.at>
>> ---
>> MAINTAINERS | 9 +++++++++
>> 1 file changed, 9 insertions(+)
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 90f13281d297..988d01226131 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11647,6 +11647,15 @@ S: Maintained
>> F: include/keys/trusted_caam.h
>> F: security/keys/trusted-keys/trusted_caam.c
>>=20
>> +KEYS-TRUSTED-DCP
>> +M: David Gstir <david@sigma-star.at>
>> +R: sigma star Kernel Team <upstream+dcp@sigma-star.at>
>> +L: linux-integrity@vger.kernel.org
>> +L: keyrings@vger.kernel.org
>> +S: Supported
>> +F: include/keys/trusted_dcp.h
>> +F: security/keys/trusted-keys/trusted_dcp.c
>> +
>> KEYS-TRUSTED-TEE
>> M: Sumit Garg <sumit.garg@linaro.org>
>> L: linux-integrity@vger.kernel.org
>=20
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
>=20
> I can for sure put this. The code quality is *not* bad :-) However, =
your
> backing story really needs rework. It is otherwise impossible to
> understand the code changes later on because amount of information is
> vast, and you tend to forget details of stuff that you are not =
actively
> working on. That is why we care so deeply about them.

got it! :) I=E2=80=99ve tried to rework the commit messages as good as =
possible
for v6 and will send that series momentarily.

Thanks!
- David=
