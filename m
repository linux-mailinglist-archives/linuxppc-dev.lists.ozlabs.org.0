Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C90DC89D455
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 10:31:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K8pkyX2y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDK193nmRz3vcl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 18:31:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K8pkyX2y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=davidgow@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDJzg3Rgqz3bs2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 18:29:51 +1000 (AEST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-56e67402a3fso10108a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Apr 2024 01:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712651387; x=1713256187; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SNbT5cD93UctgsCqkixEd7+XYgKKVPGUL5NWfauDvjI=;
        b=K8pkyX2yB0VH9BVG0jJj4iPWRFvSb2t/qWfw54r7owzVI/6rgGqaFL4nNV7MDfI2mM
         k2DPpTq9kqbXpqYl55gXMEc+QxBAVh0B37pfTtif9Y4eYxpWCfmXlLR2f7fn4aeyPtJ4
         MSD0HMX4VhxvlJ9qXFMON6m5Kj32wR357zI+5D4SIHo2Cx3N10/Xo/FAC3cADKAF7pPu
         cFTjz6uOAMCVg9/uCY5jHrSWbE+V+tAKlZrX3uHU7rYBcfC7ufsHw/V0+pQyTa0cxIhU
         mGFJwqtxNATr+eKFos5VjsHbAbJQBCcbFxz+aeYYgKU6fVaMJacsVDXKRs4nZ4P2ywty
         tUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712651387; x=1713256187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNbT5cD93UctgsCqkixEd7+XYgKKVPGUL5NWfauDvjI=;
        b=ejdiJrFMwQbs23mKYm4Ni69fM8swvQ12PP+HiUYkanMd/boQ9Jcc9uN0sbvsp6ep9g
         7BL8if0TEnM/nEsJQbMIQ/9yUoxjpoanrfSsgxgyw5INiHDwhUOL+vLmDPaUXbQe9LVw
         2eyShhNf4tQOUnaDwNb3VYkuy7Gflwn6tK65yXABjqSmi2yaO0giCQmHsqOPVJjDakM9
         4U1agGgC8xesSoiWnjOxSWkTV6YNWLceOJFJLb/XbQpFat7nNdXIoWQvSzTp1oTiDDam
         3ynU8tzw45mNAumOJVAhBxoNG76GV6pOi+Hx1WfUn96Ro0GzHZlk2j2sfp4IvCBo2U39
         VvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUglKaE2sBHYNXw1xLTDXFBYm1+xxuEOV3vFg4hd/en8JWQta/VVW63I9Dpm8q/Wnk8D8AYR7XjJUKawafEAFWU1oa8cPjMXUVWruJhDw==
X-Gm-Message-State: AOJu0YwEjFBL5skmivfJ5Nx1OM1CgMbl/XSD1GpBK/A6yukgQsrI1IbM
	0qrieTF6lDH/w/qhQDEOGrtLz/mPT/c/wDd3IfJyRfVUzwimMT6oUAt+90f5nR6qrXEfVcflZS/
	fRjg3gtZkk2wZr073qQBcu0jQkGQdLIpHihBr
X-Google-Smtp-Source: AGHT+IHd7qlT1kVW/+IHdr+eMTilo12WFoRoA9op5ye7679o1YzrCluEECXoJObuhpq63PDXFlpaJUe6nkYhavY5s7g=
X-Received: by 2002:aa7:d7da:0:b0:56e:76e:6ea9 with SMTP id
 e26-20020aa7d7da000000b0056e076e6ea9mr106201eds.6.1712651387018; Tue, 09 Apr
 2024 01:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240403131936.787234-1-linux@roeck-us.net> <20240403131936.787234-3-linux@roeck-us.net>
In-Reply-To: <20240403131936.787234-3-linux@roeck-us.net>
From: David Gow <davidgow@google.com>
Date: Tue, 9 Apr 2024 16:29:35 +0800
Message-ID: <CABVgOSmib5PSr2ZJh+oXxk55eqitw6SdgLne3X-Ua6A3fihP-g@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] kunit: bug: Count suppressed warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000950ae00615a5b907"
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

--000000000000950ae00615a5b907
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 21:19, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Count suppressed warning backtraces to enable code which suppresses
> warning backtraces to check if the expected backtrace(s) have been
> observed.
>
> Using atomics for the backtrace count resulted in build errors on some
> architectures due to include file recursion, so use a plain integer
> for now.
>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Looks good to me, thanks.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


> v2:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
> v3:
> - Rebased to v6.9-rc2
>
>  include/kunit/bug.h | 7 ++++++-
>  lib/kunit/bug.c     | 4 +++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/include/kunit/bug.h b/include/kunit/bug.h
> index bd0fe047572b..72e9fb23bbd5 100644
> --- a/include/kunit/bug.h
> +++ b/include/kunit/bug.h
> @@ -20,6 +20,7 @@
>  struct __suppressed_warning {
>         struct list_head node;
>         const char *function;
> +       int counter;
>  };
>
>  void __start_suppress_warning(struct __suppressed_warning *warning);
> @@ -28,7 +29,7 @@ bool __is_suppressed_warning(const char *function);
>
>  #define DEFINE_SUPPRESSED_WARNING(func)        \
>         struct __suppressed_warning __kunit_suppress_##func = \
> -               { .function = __stringify(func) }
> +               { .function = __stringify(func), .counter = 0 }
>
>  #define START_SUPPRESSED_WARNING(func) \
>         __start_suppress_warning(&__kunit_suppress_##func)
> @@ -39,12 +40,16 @@ bool __is_suppressed_warning(const char *function);
>  #define IS_SUPPRESSED_WARNING(func) \
>         __is_suppressed_warning(func)
>
> +#define SUPPRESSED_WARNING_COUNT(func) \
> +       (__kunit_suppress_##func.counter)
> +
>  #else /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
>
>  #define DEFINE_SUPPRESSED_WARNING(func)
>  #define START_SUPPRESSED_WARNING(func)
>  #define END_SUPPRESSED_WARNING(func)
>  #define IS_SUPPRESSED_WARNING(func) (false)
> +#define SUPPRESSED_WARNING_COUNT(func) (0)
>
>  #endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
>  #endif /* __ASSEMBLY__ */
> diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
> index f93544d7a9d1..13b3d896c114 100644
> --- a/lib/kunit/bug.c
> +++ b/lib/kunit/bug.c
> @@ -32,8 +32,10 @@ bool __is_suppressed_warning(const char *function)
>                 return false;
>
>         list_for_each_entry(warning, &suppressed_warnings, node) {
> -               if (!strcmp(function, warning->function))
> +               if (!strcmp(function, warning->function)) {
> +                       warning->counter++;
>                         return true;
> +               }
>         }
>         return false;
>  }
> --
> 2.39.2
>
> --
> You received this message because you are subscribed to the Google Groups "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kunit-dev/20240403131936.787234-3-linux%40roeck-us.net.

--000000000000950ae00615a5b907
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
LmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEANyYcO+9JZYyqQt41
TMwvFWAw3vLoLOQIfIn48/yea/ekOcParTb0mbhsvVSZ6sGn+txYAZb33wIb1f4wK4xQ7+RUYBfI
TuTPL7olF9hDpojC2F6Eu8nuEf1XD9qNI8zFd4kfjg4rb+AME0L81WaCL/WhP2kDCnRU4jm6TryB
CHhZqtxkIvXGPGHjwJJazJBnX5NayIce4fGuUEJ7HkuCthVZ3Rws0UyHSAXesT/0tXATND4mNr1X
El6adiSQy619ybVERnRi5aDe1PTwE+qNiotEEaeujz1a/+yYaaTY+k+qJcVxi7tbyQ0hi0UB3myM
A/z2HmGEwO8hx7hDjKmKbDCCA18wggJHoAMCAQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUA
MEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWdu
MRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEg
MB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzAR
BgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4
Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0EXyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuu
l9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+JJ5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJ
pij2aTv2y8gokeWdimFXN6x0FNx04Druci8unPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh
6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTvriBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti
+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8E
BTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5NUPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEA
S0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigHM8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9u
bG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmUY/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaM
ld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88
q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcya5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/f
hO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/XzCCBOMwggPLoAMCAQICEAHS+TgZvH/tCq5FcDC0
n9IwDQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjMgU01JTUUgQ0EgMjAyMDAeFw0yNDAxMDcx
MDQ5MDJaFw0yNDA3MDUxMDQ5MDJaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5j
b20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDY2jJMFqnyVx9tBZhkuJguTnM4nHJI
ZGdQAt5hic4KMUR2KbYKHuTQpTNJz6gZ54lsH26D/RS1fawr64fewddmUIPOuRxaecSFexpzGf3J
Igkjzu54wULNQzFLp1SdF+mPjBSrcULSHBgrsFJqilQcudqXr6wMQsdRHyaEr3orDL9QFYBegYec
fn7dqwoXKByjhyvs/juYwxoeAiLNR2hGWt4+URursrD4DJXaf13j/c4N+dTMLO3eCwykTBDufzyC
t6G+O3dSXDzZ2OarW/miZvN/y+QD2ZRe+wl39x2HMo3Fc6Dhz2IWawh7E8p2FvbFSosBxRZyJH38
84Qr8NSHAgMBAAGjggHfMIIB2zAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1Ud
DwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFC+LS03D
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
hvcNAQkEMSIEIBNJrXN7px6Nv4A8dJbTWnbRfbA5CXJAZ2UCkJwi2a7+MBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDQwOTA4Mjk0N1owaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBJG4Rj
+X8+taWikmSik3BaEFvc3V3a0t4QG6BjaJ6X2uwrsLMiaR7/6PHRZn90jEO1pcW81xJ8kxdQPCsU
OHtM4PSJ4he1TKFy4GEQAVGb7rxcKfc51d1aD9EkNnHeycBC4A81c28dpnRWJ64JQLv3vdosMjBT
gzUgNfuMLo/nsOcFf8Z1pf9UCAneT5Z4Bqt8GyWJgNhpPQDxOxfZt48Xz4bbghkptq3c3nLpJaRz
h1xo2AMNxd5yG4v/IFF/UWrTY/C5YKB5E+ACLEy0zBV357Ny7zDJ2CGk6Fon0v0vxij/LelcjPgl
4V1dyatZNKgZSbgRGUTN9VoCIPbEfczp
--000000000000950ae00615a5b907--
