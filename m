Return-Path: <linuxppc-dev+bounces-2695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 047FD9B59BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 03:04:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdVmN3mFqz2y3Z;
	Wed, 30 Oct 2024 13:04:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730253844;
	cv=none; b=QYZ4hc8LKJL1NZ2BauzkIpoxFSZTAMJ0GQU2opfwzrJEQtrCv0wmAvheRuxbBpbwG+60vi6wJ9s2AL74Iqxybs4xVy08zB7XWI0ujeX2nZCUZUBEXqWHlLK9Kyyzjbs4mwXfg6MgThpzHCy5Z5OmicB7R0fGxiS321ZPkkIW7Zr71uC00c65qbgLM9c3kRq3yNV4yQ45FzmsBF+5qXn3robMpxYslGxPycAG0JadhgW0AyCKy5JayFVTL6S4Sdbj7/8HLiblQQFS5q47jNDtg8Y+Uuq1cA0DdY91P6krttap1Knb007RkWjsxF/fZF6IEuBv0DzMgTJYGC/LVLr4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730253844; c=relaxed/relaxed;
	bh=JuPyDPbc2gk5S8Wqk+8pKf2mgSYZmu8HyR2K7BYNpbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNYuDuWaMbrqx2KNS2TlTOGFj7Mt09M0wgszr/v+dQOMUbqU3xh5VIfRyvRs1MpamfceYcZZJboDeA0Rv5ZkQ613SVX0TfWoNjkAj7rJqDcD+oo9kBX8SJXJ+XkQspYIfhw0liNowBcH1PVWhcJDIHB9xl4ysbEbsDl00vjGjLrR2laJU8NVaD2RPFZo8OKiDiLL0JfuR/wsRPcC/7Qq1xC66qzlKF7PzV7tacjV7ACIb88kt75jo3yeoAlumkWma1ta6lvtA59/3N21enA2mnz62EH7MgDBmvk3B2sS4uHrObh7QrWpfLb2YWUVYc1X+S+v6UdbOMatqR/yyyQlXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ORPFC/oF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ORPFC/oF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdVmL5nsYz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 13:04:01 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539f2b95775so7034555e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 19:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1730253833; x=1730858633; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JuPyDPbc2gk5S8Wqk+8pKf2mgSYZmu8HyR2K7BYNpbE=;
        b=ORPFC/oFZlV4vGlVk9ABnL9/RKXNb9bHDwS35ZFaiCArUB5rTimVN0Qe/aCAyYL09r
         LU0wkb231d2lrzAhPksN2dV7Eu/UOzHck9U3c90ldC/VTSO81mmUkifnqulvkVd+psx5
         2FymuFSCbesRkpMh8wow40hdzHb3F5QBiA6bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730253833; x=1730858633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuPyDPbc2gk5S8Wqk+8pKf2mgSYZmu8HyR2K7BYNpbE=;
        b=NmeyBQ01XOldY5i5bR3Q7QtE/6CCxgdb9fpIU2LsGxsSGWn7f0dv1TmxGo2h8TraW5
         RrDSzXo7As6S2DgaLKNPB/pm4wbICRgkHP49CJWE3OHMtwo0sEYWEaB9YOCr9tUoNFND
         Eg1rsccxsS+El95hZ0lA+PnQLzEsNpMFuLzS00LGROQpQhq9/y9E08vxiDSyCtXyfKl3
         lalwkFCE3gPejssyu+/Sk63Flv0HQNZWqULp8sg95Q5f/pUKlsVIkZWKODeMlRj+JBhB
         4k39WsTpceS85UnSX19GjwIXYDfGxAiJkuBYBV39lnGqt//wsT/M70PK+bENKUJEdh0M
         BFfw==
X-Forwarded-Encrypted: i=1; AJvYcCXi2ZBF50zScAem9Z0hC6e8T/uMAtFDrX7TR0f8Fn2TF5CAa0KRVFg1U9R8eWQIW9Syj1HMByvWx10g8+E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxAfHlmSxlpFizdpIrGjXjJNt6w+Q83CKE5O2DMaHn9yv4w5wYr
	VFxiz9cu2BFoASMAW1aYX5WkEqQzOEAd6/NTAHIbCvJ/Qq99o8XmAmGhYcNOHxQq19oQwhOzN0q
	prRBJpA==
X-Google-Smtp-Source: AGHT+IHst/l0JObpHvFE2gUI2SLwkVZDx39JdOHecxv84qwh4fJDQZbffoAEqXNxDhdS/e2tDKdldQ==
X-Received: by 2002:a05:6512:33cf:b0:533:c9d:a01f with SMTP id 2adb3069b0e04-53b348ba0bemr9137670e87.4.1730253833094;
        Tue, 29 Oct 2024 19:03:53 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bc0d5d8d0sm102755e87.190.2024.10.29.19.03.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 19:03:50 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f58c68c5so10103658e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 19:03:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5d14Zq0ZYE0ANdMl4/0R7VAxlfchCACXhumTwI8rjISlgrJ1NScImAVypyoK8QKzv6mQ0/m+vGwEMMPE=@lists.ozlabs.org
X-Received: by 2002:a05:6512:1189:b0:53b:163a:f279 with SMTP id
 2adb3069b0e04-53b34a345f7mr11433327e87.53.1730253828812; Tue, 29 Oct 2024
 19:03:48 -0700 (PDT)
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
References: <cover.1730166635.git.jpoimboe@kernel.org> <5b887fe4c580214900e21f6c61095adf9a142735.1730166635.git.jpoimboe@kernel.org>
In-Reply-To: <5b887fe4c580214900e21f6c61095adf9a142735.1730166635.git.jpoimboe@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Oct 2024 16:03:31 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgaPk0tB-RtVAK4b6dTrtTAC3WkL1LmGO==ATrDLL-DRA@mail.gmail.com>
Message-ID: <CAHk-=wgaPk0tB-RtVAK4b6dTrtTAC3WkL1LmGO==ATrDLL-DRA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] x86/uaccess: Avoid barrier_nospec() in 64-bit copy_from_user()
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: multipart/mixed; boundary="000000000000d758120625a81cd4"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--000000000000d758120625a81cd4
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Oct 2024 at 15:56, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> The barrier_nospec() in 64-bit copy_from_user() is slow.  Instead use
> pointer masking to force the user pointer to all 1's if the access_ok()
> mispredicted true for an invalid address.
>
> The kernel test robot reports a 2.6% improvement in the per_thread_ops
> benchmark (see link below).

Hmm. So it strikes me that this still does the "access_ok()", but
that's pointless for the actual pointer masking case. One of the whole
points of the pointer masking is that we can just do this without
actually checking the address (or length) at all.

That's why the strncpy_from_user() has the pattern of

        if (can_do_masked_user_access()) {
                ... don't worry about the size of the address space ..

and I think this code should do that too.

IOW, I think we can do even better than your patch with something
(UNTESTED!) like the attached.

That will also mean that any other architecture that starts doing the
user address masking trick will pick up on this automatically.

Hmm?

                Linus

--000000000000d758120625a81cd4
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m2v8eji00>
X-Attachment-Id: f_m2v8eji00

IGluY2x1ZGUvbGludXgvdWFjY2Vzcy5oIHwgMjEgKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaCBiL2luY2x1ZGUvbGludXgvdWFjY2Vzcy5oCmluZGV4
IDM5YzdjZjgyYjBjMi4uNDM4NDQ1MTBkNWQwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3Vh
Y2Nlc3MuaAorKysgYi9pbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaApAQCAtMzgsNiArMzgsNyBAQAog
I2Vsc2UKICAjZGVmaW5lIGNhbl9kb19tYXNrZWRfdXNlcl9hY2Nlc3MoKSAwCiAgI2RlZmluZSBt
YXNrZWRfdXNlcl9hY2Nlc3NfYmVnaW4oc3JjKSBOVUxMCisgI2RlZmluZSBtYXNrX3VzZXJfYWRk
cmVzcyhzcmMpIChzcmMpCiAjZW5kaWYKIAogLyoKQEAgLTE1OSwxOSArMTYwLDI3IEBAIF9pbmxp
bmVfY29weV9mcm9tX3VzZXIodm9pZCAqdG8sIGNvbnN0IHZvaWQgX191c2VyICpmcm9tLCB1bnNp
Z25lZCBsb25nIG4pCiB7CiAJdW5zaWduZWQgbG9uZyByZXMgPSBuOwogCW1pZ2h0X2ZhdWx0KCk7
Ci0JaWYgKCFzaG91bGRfZmFpbF91c2VyY29weSgpICYmIGxpa2VseShhY2Nlc3Nfb2soZnJvbSwg
bikpKSB7CisJaWYgKHNob3VsZF9mYWlsX3VzZXJjb3B5KCkpCisJCWdvdG8gZmFpbDsKKwlpZiAo
Y2FuX2RvX21hc2tlZF91c2VyX2FjY2VzcygpKQorCQlmcm9tID0gbWFza191c2VyX2FkZHJlc3Mo
ZnJvbSk7CisJZWxzZSB7CisJCWlmICghYWNjZXNzX29rKGZyb20sIG4pKQorCQkJZ290byBmYWls
OwogCQkvKgogCQkgKiBFbnN1cmUgdGhhdCBiYWQgYWNjZXNzX29rKCkgc3BlY3VsYXRpb24gd2ls
bCBub3QKIAkJICogbGVhZCB0byBuYXN0eSBzaWRlIGVmZmVjdHMgKmFmdGVyKiB0aGUgY29weSBp
cwogCQkgKiBmaW5pc2hlZDoKIAkJICovCiAJCWJhcnJpZXJfbm9zcGVjKCk7Ci0JCWluc3RydW1l
bnRfY29weV9mcm9tX3VzZXJfYmVmb3JlKHRvLCBmcm9tLCBuKTsKLQkJcmVzID0gcmF3X2NvcHlf
ZnJvbV91c2VyKHRvLCBmcm9tLCBuKTsKLQkJaW5zdHJ1bWVudF9jb3B5X2Zyb21fdXNlcl9hZnRl
cih0bywgZnJvbSwgbiwgcmVzKTsKIAl9Ci0JaWYgKHVubGlrZWx5KHJlcykpCi0JCW1lbXNldCh0
byArIChuIC0gcmVzKSwgMCwgcmVzKTsKKwlpbnN0cnVtZW50X2NvcHlfZnJvbV91c2VyX2JlZm9y
ZSh0bywgZnJvbSwgbik7CisJcmVzID0gcmF3X2NvcHlfZnJvbV91c2VyKHRvLCBmcm9tLCBuKTsK
KwlpbnN0cnVtZW50X2NvcHlfZnJvbV91c2VyX2FmdGVyKHRvLCBmcm9tLCBuLCByZXMpOworCWlm
IChsaWtlbHkoIXJlcykpCisJCXJldHVybiAwOworZmFpbDoKKwltZW1zZXQodG8gKyAobiAtIHJl
cyksIDAsIHJlcyk7CiAJcmV0dXJuIHJlczsKIH0KIGV4dGVybiBfX211c3RfY2hlY2sgdW5zaWdu
ZWQgbG9uZwo=
--000000000000d758120625a81cd4--

