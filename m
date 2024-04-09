Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 914D389D469
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 10:32:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Q+X9qTub;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDK312xRyz3vjg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 18:32:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Q+X9qTub;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=davidgow@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDJzw2XfNz3dTB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 18:30:04 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-56e67402a3fso10123a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Apr 2024 01:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712651401; x=1713256201; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iTuvAKz+Flrqb9IOQGVCThB9+763aW1D45cIMLDiQDU=;
        b=Q+X9qTub5FnzHWyzn+OehJ0ZQK7QOQp3E93jjfyPim9OsSRak8TyWmar+hdJKhIBUP
         5xGK7zWnauW0X+ROse4nEm30m3j2dquDmhAgRam80YxS+plraHbtvanDcfsaLpJb9U5r
         XJHdNzQ0lb71agP5ovbemd6BD2xGwX7tFuzLw52VRxySa5zTzo44MyGxSNrBREUXydAd
         ZoJ4+0j18Ok2MBfNhLs+fg7pGg65ZKgDoTJ1YOK4cvA8ZoKk+homfXbOJA62amqbWAhF
         xYJMCt/J52D41tT75BTxtyS4M4z/Elpn1OULbpkH0jGJZigJ1BCX5nrRkepAaeyI5/9g
         wJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712651401; x=1713256201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTuvAKz+Flrqb9IOQGVCThB9+763aW1D45cIMLDiQDU=;
        b=v7MUGUFRE6s6yvFngjIiGJthe195rrIU7vqj8n+rXBCk7QLTzy9xJBynggPp1el/n9
         L+yyJ3iDx8pRfS/NJRAvmt5XCtktjCb7utMtxs4m6dVxu+x7Ix0sKG7TzoswL/m8c+Zn
         QPVnH0okMlV+hv0+BbvDTJhCOFhywxHhOBW5CmBED039uNYWXynyJqWJ//6xVCsXp+oY
         pZcdTHvn/f03YtBukmPkcLzsRDkOFy9myX/mjS2KVLUoM2O+WBuTJVzFBIuWfYETXXVS
         6jvEIe/LLE5yNP1Y3saZjga7lwPE8VQsmMce25LvGIHakWdsj5iju8Z+ISJW+DGJrLz3
         PE6A==
X-Forwarded-Encrypted: i=1; AJvYcCVgTv2nhL/mKHqXdT5tja6xuyx0mr70DtelNlK/vEvAYrE9WKbOJMZuOsR44B2ysPFti4rXK/wsDBTYupJj4I3XSIiOdwYNGvdtw+Yi6Q==
X-Gm-Message-State: AOJu0YwnhBCml4hNfcEhjl9HawojL1nI8+HL+SWPD8DIJsCjIZi+2L/S
	zWMzNC5sCafIeA7pnZgvp7WS9GubSZiac/qXyvq/gUxoBbJqD4jPxfc/mJHH3bkGDiQLxQUfnLj
	U6B0j/DyhiWeLuC0NoXXrp7eorFUb7h/AFhLN
X-Google-Smtp-Source: AGHT+IHYaeERcEkkmGD/A4tACg9YKD4kdNmAMVD2CKRyiAat0V+rnkCQ2SItMKP8w6Jo/7F9MnxE50/WwG55IF7tH+4=
X-Received: by 2002:aa7:d7da:0:b0:56e:76e:6ea9 with SMTP id
 e26-20020aa7d7da000000b0056e076e6ea9mr106213eds.6.1712651400934; Tue, 09 Apr
 2024 01:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240403131936.787234-1-linux@roeck-us.net> <20240403131936.787234-5-linux@roeck-us.net>
In-Reply-To: <20240403131936.787234-5-linux@roeck-us.net>
From: David Gow <davidgow@google.com>
Date: Tue, 9 Apr 2024 16:29:49 +0800
Message-ID: <CABVgOSkk-QhmemH0p_VmiLrqLDs7SxD-mc-mjzfE4+1tj5mB+w@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] kunit: Add documentation for warning backtrace
 suppression API
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006793a80615a5baa4"
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
Cc: x86@kernel.org, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Linux Kernel Functional Testing <lkft@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, loongarch@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kern
 el.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000006793a80615a5baa4
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 21:19, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Document API functions for suppressing warning backtraces.
>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

This looks good to me: thanks for adding the documentation!

If we add integration between this and the KUnit resource system,
we'll need to add that to this documentation.

I wonder if it would make sense to have an example where the
DEFINE_SUPPRESSED_WARNING() is global, e.g., in the test init/exit
functions. That might overcomplicate it a bit.

It also might be nice to document the individual macros with kerneldoc
comments. (Though, that could equally fit in patch #1).

Still, this is the most important bit, so I'm happy to have it as-is.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


> v2:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> v3:
> - Rebased to v6.9-rc2
>
>  Documentation/dev-tools/kunit/usage.rst | 30 ++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
> index 22955d56b379..8d3d36d4103d 100644
> --- a/Documentation/dev-tools/kunit/usage.rst
> +++ b/Documentation/dev-tools/kunit/usage.rst
> @@ -157,6 +157,34 @@ Alternatively, one can take full control over the error message by using
>         if (some_setup_function())
>                 KUNIT_FAIL(test, "Failed to setup thing for testing");
>
> +Suppressing warning backtraces
> +------------------------------
> +
> +Some unit tests trigger warning backtraces either intentionally or as side
> +effect. Such backtraces are normally undesirable since they distract from
> +the actual test and may result in the impression that there is a problem.
> +
> +Such backtraces can be suppressed. To suppress a backtrace in some_function(),
> +use the following code.
> +
> +.. code-block:: c
> +
> +       static void some_test(struct kunit *test)
> +       {
> +               DEFINE_SUPPRESSED_WARNING(some_function);
> +
> +               START_SUPPRESSED_WARNING(some_function);
> +               trigger_backtrace();
> +               END_SUPPRESSED_WARNING(some_function);
> +       }
> +
> +SUPPRESSED_WARNING_COUNT() returns the number of suppressed backtraces. If the
> +suppressed backtrace was triggered on purpose, this can be used to check if
> +the backtrace was actually triggered.
> +
> +.. code-block:: c
> +
> +       KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(some_function), 1);
>
>  Test Suites
>  ~~~~~~~~~~~
> @@ -857,4 +885,4 @@ For example:
>                 dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
>
>                 // Everything is cleaned up automatically when the test ends.
> -       }
> \ No newline at end of file
> +       }
> --
> 2.39.2
>

--0000000000006793a80615a5baa4
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPqgYJKoZIhvcNAQcCoIIPmzCCD5cCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg0EMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
7xDrOPfX3COqq162RFg/MFcGA1UdIARQME4wCQYHZ4EMAQUBATBBBgkrBgEEAaAyASgwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/
BAIwADCBmgYIKwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNp
Z24uY29tL2NhL2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgw
FoAUfMwKaNei6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEB
AK0lDd6/eSh3qHmXaw1YUfIFy07B25BEcTvWgOdla99gF1O7sOsdYaTz/DFkZI5ghjgaPJCovgla
mRMfNcxZCfoBtsB7mAS6iOYjuwFOZxi9cv6jhfiON6b89QWdMaPeDddg/F2Q0bxZ9Z2ZEBxyT34G
wlDp+1p6RAqlDpHifQJW16h5jWIIwYisvm5QyfxQEVc+XH1lt+taSzCfiBT0ZLgjB9Sg+zAo8ys6
5PHxFaT2a5Td/fj5yJ5hRSrqy/nj/hjT14w3/ZdX5uWg+cus6VjiiR/5qGSZRjHt8JoApD6t6/tg
ITv8ZEy6ByumbU23nkHTMOzzQSxczHkT+0q10/MxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIz
IFNNSU1FIENBIDIwMjACEAHS+TgZvH/tCq5FcDC0n9IwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEIMXhuV4hAHg3WgSFIsVm8yZuEYXLcz0bF2GnnCPTizkFMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDQwOTA4MzAwMVowaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBDmb9s
luNjFtSKUt94yd39an5GkioJdQi7RC0pT3hYcoy6KF55ujlFc7E549YObxZARF6tf59fXC/TQ1nI
VkzuQXeeCx3jyjDBT2X/hZ/8/vo281f9Gi5wZmL51A+PK4VqiMELHh+2a1y1YRNlpwT8M4860S9j
OCpKRcQFu1NMo9RHq35B2nYyjsqJCVJvEhvkhZXKyfSKXwYqH2VzB5YRJdrtGPFFMNsEFOOWOLZ3
YmzFe3uye13PO4CKPtjeic5tmA6SrmKVXs78+06XherENkLGiMkChl3KDKXAr8dz3M+bmur0vO3k
b/OoQc4mFepL31ZARxwvAIoOcJB1bh/F
--0000000000006793a80615a5baa4--
