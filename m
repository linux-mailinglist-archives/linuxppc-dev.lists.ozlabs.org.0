Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D634875E59
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 08:18:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=SpfLTwe7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrcwD2Gs9z3vYg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 18:18:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sigma-star.at header.i=@sigma-star.at header.a=rsa-sha256 header.s=google header.b=SpfLTwe7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sigma-star.at (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=david@sigma-star.at; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrcvT534hz3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 18:17:55 +1100 (AEDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a45bb2a9c20so223232166b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Mar 2024 23:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1709882267; x=1710487067; darn=lists.ozlabs.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YvX8bPEV2BI0BpF/k+pwUbl0NZXlnKf36uLhchuK3c=;
        b=SpfLTwe7Y/OpSynzASK22gC0qHKwwcZmXJSw5Urdi/TBMX0nZFBe6ETAgd2FDokU6D
         psOrAwT9lkZa+E/h8Y+VYPkQAns45KOqvBFAqo0QSDFQvQH1b0Hz2JIe6gTKuCpkPTGK
         gOqPKP8FZye3GH0OG/O3erm+BpFI4QXQJN0cUTXHKNZpNPh1X5NR8hiHYXBDzvZxPVZX
         uT6bKk69AC3W2eQiingd7FRXegQwVrBOKLD/RaUOA/+1OeS+fc/tfDSFysmNfmvzsUf6
         L1mfWfHok5QrmKogAAWoNL+CQrOWOHlm1mp/DV38NKGMA+C0B9H6qVuCjz+vgAjm+X+I
         GQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709882267; x=1710487067;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YvX8bPEV2BI0BpF/k+pwUbl0NZXlnKf36uLhchuK3c=;
        b=D7zhy/bdOJGtMaOynsBdzLUO78wmNBoQ9sueMx2fcKZCZkPUCIZTv26Ntrw2BRqXcB
         5vJLF9vNxayV+cpyLY6HX06Hs2hCLu4Y/Zwbuh68LTZsPtfgU9IVJ5ujfK7e3q8T8KEZ
         cG4lt+OWLo6MkwsFK5Q44xSv1lwwaNoybVsC9+kFckJvk51VzmI0KQbfX8Pi/7Uw3b67
         aTtArBilSgOLG202E3UyBb4YdsBR6ticDK6NR/CCrbqEYUzsDDGHMm0Y+U+c9qewTENG
         ggQDrAPy7SXujQu+pFeWJnzo5ubZJeoUb4cLm9r83zv4bfz5JJPkUmmQ+3p/9IWuSpRG
         PWpg==
X-Forwarded-Encrypted: i=1; AJvYcCVldilpGxBqTAT7jQY6BkjuJhTSoGhPt9ulcpRa54naPS/DRt67HS+tBQrOOHyHLTSfryfG7o25MiiKRJRABW84E2a/oFSfHA8Cl3pCgQ==
X-Gm-Message-State: AOJu0YxuMRsjfU7dW3aW/brhCpTHTJHH2AA9EFKi2c4nVCefzHvE3BWt
	CXgJ12fH44DI44Q6jIOVaPcrpEDcX+QaWUTc0aiv8/aGlnCWL7MQz/lxW7HKq84=
X-Google-Smtp-Source: AGHT+IGiGod9W2YM4YZ6sUKkrNh7qVjymDesOFOXF8mtdCcbqIFTzGM2YQaR07gH4KtP9j0849dGZQ==
X-Received: by 2002:a17:906:339a:b0:a44:ff95:3911 with SMTP id v26-20020a170906339a00b00a44ff953911mr11831490eja.66.1709882267100;
        Thu, 07 Mar 2024 23:17:47 -0800 (PST)
Received: from smtpclient.apple (clnet-p106-198.ikbnet.co.at. [83.175.106.198])
        by smtp.gmail.com with ESMTPSA id f27-20020a170906085b00b00a44ef54b6b6sm6582541ejd.58.2024.03.07.23.17.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Mar 2024 23:17:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v6 3/6] KEYS: trusted: Introduce NXP DCP-backed trusted
 keys
From: David Gstir <david@sigma-star.at>
In-Reply-To: <CZNRMR5YZPQO.1QBLW62A6S840@kernel.org>
Date: Fri, 8 Mar 2024 08:17:35 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <655221B7-634C-4493-A781-CF014DFFC8BF@sigma-star.at>
References: <20240307153842.80033-1-david@sigma-star.at>
 <20240307153842.80033-4-david@sigma-star.at>
 <CZNRMR5YZPQO.1QBLW62A6S840@kernel.org>
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, NXP Linux Team <linux-imx@nxp.com>, James Bottomley <jejb@linux.ibm.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven Rostedt \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-arm-kernel@lists.infradead.org, Paul Moore <paul@paul-moore.com>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" 
 <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jarkko,

> On 07.03.2024, at 20:30, Jarkko Sakkinen <jarkko@kernel.org> wrote:

[...]

>> +
>> +static int trusted_dcp_init(void)
>> +{
>> + int ret;
>> +
>> + if (use_otp_key)
>> + pr_info("Using DCP OTP key\n");
>> +
>> + ret =3D test_for_zero_key();
>> + if (ret) {
>> + pr_err("Test for zero'ed keys failed: %i\n", ret);
>=20
> I'm not sure whether this should err or warn.
>=20
> What sort of situations can cause the test the fail (e.g.
> adversary/interposer, bad configuration etc.).

This occurs when the hardware is not in "secure mode". I.e. it=E2=80=99s =
a bad configuration issue.
Once the board is properly configured, this will never trigger again.
Do you think a warning is better for this then?

Thanks,
- David

