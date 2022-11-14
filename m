Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C39627A4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 11:17:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9lcC6LCKz3cfF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 21:17:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tXELKIGb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=sroettger@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tXELKIGb;
	dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9lRn1Dcbz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 21:10:11 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id k4so7047857qkj.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 02:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D1o90UC01dBrcgr7uD5tBeHh6PR4mHDnoEYuSFrGNtE=;
        b=tXELKIGbZyW7BVoWHIaIqoyvN3WIrMOMyA0UuzKxkANUF/T0Ux624fPfUGGkZ1LS5u
         qNjH2G1sYC4v2Y+W+Al9Zos3XoWBsij4zOI2wZPxkyJNzkOgn0omzei6iasMVfhi59LE
         f/BQffvNyPqiAtZwioIRQKNI1Ym+IY9W8sFmslyK8c4o+e3m3c+R8+SgUfoAXbOmi97n
         FYBUg9S7o+4mPrS4ZSZi4nn32RS6GponMPXLhGH3bHJH28yl/NLE9+wTiFw26mk6gWRi
         xOAyaRmmpKVrerAEFj0REQoF3e50f7kMMMKojnGBPf5KeyPL1A4i4+10S5jr6tI4VbLL
         t5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D1o90UC01dBrcgr7uD5tBeHh6PR4mHDnoEYuSFrGNtE=;
        b=dvQpqgvJFTXXa9/qhDyoTmdbeRsLvcB9QfUQBxYKUQrywNWn/2w19/lsBmzNll+pVK
         nq7njmrmyjd80wb7MYTSVJ08ymighwhz8vBxbGeL8nVvdR9h/HlmqMb6q/riQ3L7u4Xc
         Pc16JamPIEaqhR9ypRlb8UDdpsK4G10LTpfGGSME925UkE5ta/WwuUQmXOxLST4dvOnn
         byL8L9J8sdxLJ72wJlyqF3g03bpIfO3Pb3JTadYo9hrPr84BZ9sWQ9Nr6wJ6tFzkoMia
         2mNwBrXeThKOYLqleaFLYLbYXucu4KN/1Sf/bLbvLVG0dgo6N0HeasyjArwJb3pGHAFV
         RZPg==
X-Gm-Message-State: ANoB5pnfsNdEdrrPRLEiBiN5E9P1sL3QPkWhYGlz2mFraeS8CuNfFUnm
	Rq6Fa8qvY4XKKTEwIC1OYbfBrDwk3zbGazqz9ZGtIg==
X-Google-Smtp-Source: AA0mqf598FhApNL5Hf2kEFod8JsD+HmLF+iODSEyDpFtarkHMZysDJvADPsQ6Rdon0WERh3t+PB/kBxTnsxhgbK/m8U=
X-Received: by 2002:a37:be86:0:b0:6f9:f247:88ca with SMTP id
 o128-20020a37be86000000b006f9f24788camr10578059qkf.59.1668420606623; Mon, 14
 Nov 2022 02:10:06 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Stephen_R=C3=B6ttger?= <sroettger@google.com>
Date: Mon, 14 Nov 2022 11:09:54 +0100
Message-ID: <CAEAAPHZrMDGsAnZM=GC0bu5WpGvXaDakJBq-WDkW06aDc7_68w@mail.gmail.com>
Subject: Re: [RFC PATCH] seccomp: Add protection keys into seccomp_data
To: msammler@mpi-sws.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009dc31705ed6b7124"
X-Mailman-Approved-At: Mon, 14 Nov 2022 21:16:46 +1100
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
Cc: wad@chromium.org, Kees Cook <keescook@chromium.org>, linux-api@vger.kernel.org, linuxram@us.ibm.com, luto@amacapital.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000009dc31705ed6b7124
Content-Type: text/plain; charset="UTF-8"

> Add the current value of an architecture specific protection keys
> register (currently PKRU on x86) to data available for seccomp-bpf
> programs to work on. This allows filters based on the currently
> enabled protection keys.

We're currently working on a feature in chromium that uses pkeys for
in-process isolation. Being able to use the pkey state in the seccomp
filter would be pretty useful for this. For example, it would allow
us to enforce that no code outside the isolated thread would ever
map/mprotect executable memory.
We can probably do something similar by adding instruction pointer
checks to the seccomp filter, but that feels quite hacky and this
feature would make a much nicer implementation.

Are there any plans to make a version 2 of this patch?

--0000000000009dc31705ed6b7124
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPoQYJKoZIhvcNAQcCoIIPkjCCD44CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz7MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
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
sz7RGMFaSStMyOLBknrDoPcwTAYDVR0gBEUwQzBBBgkrBgEEAaAyASgwNDAyBggrBgEFBQcCARYm
aHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/BAIwADCBmgYI
KwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2Nh
L2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJlLmdsb2JhbHNp
Z24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgwFoAUfMwKaNei
6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9iYWxzaWduLmNv
bS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEBADxHuVAXK0J/
tmhilgqykP+t0SazSxAHRxmPTTg6Cc7TFbQSRERTydbE3t5CaZoTYrhnRC+xTwmOeIyyab3fXoEG
2+vUQ1xZm5XfMjcw3EINopXAyFuB0Xjkuw4Ln9KUkGCZdiDZoGk3MVxE+IZHwoCgYkNvEuwPLq9M
cJq1kORO/au4JOBpdsJqzT/agKYjjiku/sz/Zk+hDSPdsea8wfuxnSUSpJrdEVKTQNSdoxWDrQXj
fn1Hzsf2x3Ewh+aOMcczShA7gA7syqQ50rolQFxkaB4ljQaCUzR6vYCZi7L3DA5G6MiAlJcSoq4A
xEDwfbryTuo1QZP+43heleunvWQxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIzIFNNSU1FIENB
IDIwMjACEAHaNzji1wowJ2QV6D96JKMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIE
IMJgV6xewM9UYhEL5yTQdnp3CEBrUkSR4kXbF3Qnhe91MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0B
BwEwHAYJKoZIhvcNAQkFMQ8XDTIyMTExNDEwMTAwN1owaQYJKoZIhvcNAQkPMVwwWjALBglghkgB
ZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQow
CwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQA3wlfFdWrKE46GcrVE
K3HseK0bRwLexGWHilfY1lpnXrVF9bu57XNHUsoKc4c9clDeQsLMzPGTQUZ7uJlO7j6/D4/rMtG8
TTY/3Ieh43teJxMpZGTEfutGws7SXQ1tI5LHZjN7g+BB2qUj2mGR/EWFJat2ghVUVuwM2Gj+gaCI
/KDq1x3ohKp0U2zF3QetF/atBS6ZGcLrl1Bp7MJQ03UTEi/TeqeF2DlSYiOfcikfjYXKa/BMPEV5
4elIEpdn8M7KlSUsLuJLPFgqh5YSun2GUnV+5ex7QTEja5HzvuNEmBLu9M14yqzYdivXweiZh7DF
/f7R+YTTD9WAHFgT19Tu
--0000000000009dc31705ed6b7124--
