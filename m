Return-Path: <linuxppc-dev+bounces-5985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D05A2D51F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 10:07:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqlN95wR8z30Vd;
	Sat,  8 Feb 2025 20:07:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f34"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739005641;
	cv=none; b=aiTHiCZbXW7YP5+u4kliQIguWPowsp8qtSPOaOX4qxXM3Cwm5E4wsTxDvD7Ts0I10KRcYuyGzqHOJyvoeMZo/YVtWBUUX5wX3ECJyAgfK8AAq8NdcYkmE9yfxhRdEVHpwRW7KbfA6cCTuwcZvp+8fAht63K711FHqrO2YJ5FipSQI9O3qxWRaiA1g0i4g50MqHtHYkUy8A4ofyjCrXqiFCpXakCoAGPik8/Uf0k0kO12bHq5hL4eHUfc+f2SoeXPYaUxLQP4jwEL6QYrrLaASjNiKR4N/vTK/cGRsMrv7v4XpeCiEJ8bW9jDRTzuuwIxEj51rrLbUe/RH9wszxM5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739005641; c=relaxed/relaxed;
	bh=4q0TBBWcY/BgefLvNwDfGMUFgwYhHt2wHC8tmmGM74Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ei8J7ox/sD2CDX0IEGorbOTAKojESimTab1NmEChAeArhmxO4yGSngPZEjMufVvdbmFXFQmr/5kWUcITcLfHhH2mmeNhwFbv91Hz1ZTNb9zRPSKWVCuxF0S3Y0+12ViRNbVYsj9Cj+k235onEhNqpQXZMhLpjg7tMYKh9W/02nyL/wLaPzq2P3TNPQBzQoqAkFYkAkkqRu1bYMpnw7Boo/9JM7d9d0PZzly/W+0P/3UZ3axw5Zyz3yqaMePRmhoO33m/rioUUqTllpqjXn7xoDcLT3BubSvcLI3VMQXrBGPWmYfO+CuC3aqiCI443JQFQF1jTguCwHntVQa2XLov3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nOuqF/+H; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=davidgow@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=nOuqF/+H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f34; helo=mail-qv1-xf34.google.com; envelope-from=davidgow@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqlN90fyFz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 20:07:20 +1100 (AEDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6e436c59113so25626736d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Feb 2025 01:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739005639; x=1739610439; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4q0TBBWcY/BgefLvNwDfGMUFgwYhHt2wHC8tmmGM74Q=;
        b=nOuqF/+H/vvk3OunIu7mYgLxqpUlt3cKkR3fWNaqy7U5gNbNVRbOamUo6clSDF9Wx9
         R9fiYA3p759o+dUG+L0zacEu/ALdW9UO09nWnjnKZzmy1sWAmSaUHCwvRca1tkPwPvMh
         kzPT/X0acHIjHge4GjrL2bkXsQ2e2JLNimSYzi0t3Otzp7OcsZbMyiwlv+aCUsdXABF5
         JqQJhyvHyqwlZvkG4Oo7Z7HPF/1vikkDfgZJXBlIQqyJgsRcNxrC4zFSZFrk+V0uXxmh
         VsLK7Q5YJZ4kF8suBb9Ze9u4dHQjlKiY2KQlSX6y27RwaH0G6wtCcK8z3KeQ73smR6hH
         BWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739005639; x=1739610439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4q0TBBWcY/BgefLvNwDfGMUFgwYhHt2wHC8tmmGM74Q=;
        b=T4PSLmsiX6Ksd0sHts08czzENV5uQp0UJJShHuf4PkvReIjkr43YnSuI/f/Uw3HsPU
         l/FxPJVGh4Wle/diiFpdGtHaZJWbZvZSzB9vyu9jALxwWCg9fFBRZBzt6uk5pE/262Ti
         nH/K07EBrJ19l8dIrRz8b103LuqUmz6U/8EgDh8c6u3sISqUR2mc8UeUX7YdIVAqQfTi
         x3S949RL+GWIEuyPEees4uAwMuqFGL1cCRHgrauBtB41tF/MFe01DVCsGJwXALHUNUDg
         /bmTpcZ2s1MrPbXqQrfQ1T2plT+d978HxkgTPxwK+PoL1XPF9vtU56gKxjX39DievTgY
         W77A==
X-Forwarded-Encrypted: i=1; AJvYcCX0veMsC3epab6qTah6VVcyZxzO3Vw6d9Sbne0Fg8M12aPdB6Yuf2rwIZZAI6jvOcPGyCHggAvpkJWBPlk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwP8uOt6IYeGhNwPxyyzKn9NK6LE+A6oyd/WMJZg4wCjrRM/sPu
	IHpLJhjkn3bbevIZvcwoQrOFvK4u41Pao/PWSqtEloihiD4YYcsKH4HAH76ICd7lC90ttFUhFob
	RnR3l21Kuc7xwvyFw7NkjVHJP6FOGOTt7MF8D
X-Gm-Gg: ASbGncvsigOtQeG+1RASBLQPWLPvUD3rm6CmP3xHjnTkz9Y7conP86/tWWZNAQ1Xr+t
	LDmY2zrHsozSOW5R5a65FSbhJqxFarnmFj/vmqIS+umrXHzqkCbEmEyMJFLwT4/1eYdTuH/1IOA
	==
X-Google-Smtp-Source: AGHT+IGay8gFdb7RAs7LiULPPCqhqkRSrI0RCOjR4/EWgtr5VVgVZx/Mxpf1kmvlCJSGYC8TOirqP8kKTgvxBt0iOjg=
X-Received: by 2002:a05:6214:1c42:b0:6d8:6a74:ae68 with SMTP id
 6a1803df08f44-6e4456fb66emr80802026d6.29.1739005638526; Sat, 08 Feb 2025
 01:07:18 -0800 (PST)
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
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com> <20250207-bitmap-kunit-convert-v1-1-c520675343b6@gmail.com>
In-Reply-To: <20250207-bitmap-kunit-convert-v1-1-c520675343b6@gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 8 Feb 2025 17:07:05 +0800
X-Gm-Features: AWEUYZk2p5h9eQu-fsq9yvNDD1LaZ2sxRstzOkmnoLGTphT_05FAb5N8QQl3Fa4
Message-ID: <CABVgOS=25wXRt1eLDe+9Gyy+p9SNWek4jtM3khhGGy1L_E0-Ng@mail.gmail.com>
Subject: Re: [PATCH 1/3] bitmap: remove _check_eq_u32_array
To: Tamir Duberstein <tamird@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000005fce3d062d9dcdee"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--0000000000005fce3d062d9dcdee
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Feb 2025 at 04:14, Tamir Duberstein <tamird@gmail.com> wrote:
>
> This has been unused since commit 3aa56885e516 ("bitmap: replace
> bitmap_{from,to}_u32array") in 2018. Remove it to avoid the need to port
> it to KUnit in this series.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---

Makes sense.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  lib/test_bitmap.c | 28 ----------------------------
>  1 file changed, 28 deletions(-)
>
> diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
> index 65a75d58ed9e..c83829ef557f 100644
> --- a/lib/test_bitmap.c
> +++ b/lib/test_bitmap.c
> @@ -100,34 +100,6 @@ __check_eq_pbl(const char *srcfile, unsigned int line,
>         return true;
>  }
>
> -static bool __init
> -__check_eq_u32_array(const char *srcfile, unsigned int line,
> -                    const u32 *exp_arr, unsigned int exp_len,
> -                    const u32 *arr, unsigned int len) __used;
> -static bool __init
> -__check_eq_u32_array(const char *srcfile, unsigned int line,
> -                    const u32 *exp_arr, unsigned int exp_len,
> -                    const u32 *arr, unsigned int len)
> -{
> -       if (exp_len != len) {
> -               pr_warn("[%s:%u] array length differ: expected %u, got %u\n",
> -                       srcfile, line,
> -                       exp_len, len);
> -               return false;
> -       }
> -
> -       if (memcmp(exp_arr, arr, len*sizeof(*arr))) {
> -               pr_warn("[%s:%u] array contents differ\n", srcfile, line);
> -               print_hex_dump(KERN_WARNING, "  exp:  ", DUMP_PREFIX_OFFSET,
> -                              32, 4, exp_arr, exp_len*sizeof(*exp_arr), false);
> -               print_hex_dump(KERN_WARNING, "  got:  ", DUMP_PREFIX_OFFSET,
> -                              32, 4, arr, len*sizeof(*arr), false);
> -               return false;
> -       }
> -
> -       return true;
> -}
> -
>  static bool __init __check_eq_clump8(const char *srcfile, unsigned int line,
>                                     const unsigned int offset,
>                                     const unsigned int size,
>
> --
> 2.48.1
>

--0000000000005fce3d062d9dcdee
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUqgYJKoZIhvcNAQcCoIIUmzCCFJcCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
YE9NAgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHgsCGkO2Hex
N6ybc+GeQEb6790qMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQAs
exV05yVDmPhHRqOq9lAbfWOUvEf8zydxabZUHna6bayb83jD2eb9nMGGEprfuNBRmFg35sgF1TyN
+ieuQakvQYmY8tzK49hhHa2Y3qhGCTqYTHO3ypHvhHsZiGbL0gmdgB9P8ssVIws//34ae99GUOxo
XKTxPwwsQ5Arq42besv3/HXAW+4nRAT8d3ht5ZWCHc5rjL/vdGzu7PaYo3u0da69AZ8Sh4Gf5yoc
QANr2ZkMrxXbLmSmnRvbkQrzlZp2YbTFnczx46429D6q75/FNFOL1vAjxtRAPzkyACvW0eKvchza
TMvvD3IWERLlcBL5yXpENc3rI8/wVjqgAWYxlFg1b/4b/TCgYe2MZC0rx4Uh3zTIbmPNiHdN6QZ9
oDiYzWUcqWZ5jCO4bMKNlVJXeCvdANLHuhcC8FONj5VzNgYXs6gWkp9/Wt6XnQPX4dF4JBa8JdL/
cT46RJIzoiJHEx/8syO5FparZHIKbkunoq6niPsRaQUGeqWc56H4Z1sQXuBJN9fhqkIkG0Ywfrwt
uFrCoYIRlx4rSVHpBIKgnsgdm0SFQK72MPmIkfhfq9Fh0h8AjhF73sLO7K5BfwWkx1gwMySyNY0e
PCRYr6WEVOkUJS0a0fui693ymMPFLQAimmz8EpyFok4Ju066StkYO1dIgUIla4x61auxkWHwnzGC
AmowggJmAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAcDMKctW1GQKDKqEUSh4
pjANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgOJhilG7ibWyICHiHtxd7jfq1Hem6
kfdoAzMIoEYh3wYwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUw
MjA4MDkwNzE4WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAIERfzIgWSsE+sH9ZbbgrCFr8qILjIy/P5zFJJUfpVuu42Wj
8CHHZFEMT2nvEKTjVeMwCf1CQnH6OA6FuVAmJoDZTkvllSLYZ8Ek0W7Oru0Q4Y1ZFq74zkqNphyM
Ozvr8COe/jOcbyQpmNKP/Y6gB3qRzo7aVvqrkUUtzPjSYuiBFt8daQgL0URCgSHw06mVMFoveBR7
sGQSCSzSEoiKjPS/OxaRtqnIlkF08zrk4Bfz4g/RaU4lBrjdImUXmbVoU1P1ffArOkQGbqLNwXnQ
qIOfPVik0DWTHzk9Ivm3o27ncf91DGY/akKW1vKBAIeTGpUtNMQqCPGYqGtDEN694TM=
--0000000000005fce3d062d9dcdee--

