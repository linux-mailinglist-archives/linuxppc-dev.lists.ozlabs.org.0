Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362498624A2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 12:44:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=EbTOq1kk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThlQl01nfz3vcV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 22:44:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=EbTOq1kk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th1BF6r9hz3cM4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 18:00:53 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-29a378040daso442722a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 23:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708671650; x=1709276450; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4GCWRgSIGMo/1Rh1pYhbGvrkqDe2+bZmSg4IK0oi67Y=;
        b=EbTOq1kkUyJQbVxEVlDH+xnoWNH95fkr0GI+ddsBI84AoZjpXsj0R35LI1HLIRhGFB
         HU/i7yrtWOEBxzx8YwKPXMOPdOedr845lFkrw3s7qsXi0x/rEpxjpImzbhP3KiSFz0cj
         5RndUzdR8/pstuRQL/OpaFJ4RsB+97Bx0yx1Aiy5Ch8kx3O8+zCP0Z9Jt0l5lN5i8RFy
         Ca00l6wjeTd6FDxTchdHnCjlyxY25Wh++clmCWI35Ofc/mqO3W/zE8kVqjxKc+t17jA1
         ++QHkOTindDGb5kEPm90sxLW0QwCQKGr3a+/pgOo1zvtju3+aKfRSF5w56oRuGs1Kh6k
         RY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708671650; x=1709276450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GCWRgSIGMo/1Rh1pYhbGvrkqDe2+bZmSg4IK0oi67Y=;
        b=JGg3cyT4MDeY6IOpSYgJujwzvf/uk1E66lFj7itnbKPh6pJzNYp1V3wO2auNHlazW9
         SeJe3sHJKSSPDlLLvZeROcwUePnuTbRZmw0c+5v1nFToaq4zAgS1N9ChxEFcEGkve2pw
         7BPKv6ZdPYIr8fHNCtfgdI4CKFLuBOAswO/Klj7tzXvE0xcZohtofNNTgSucrG6B1drr
         0+xmWcz+2H5Qp3UJMkVd1S0COs48feQ3nwmh9G4iXD9zwsbU/g4jexjt8BNAR0Vc/EcC
         1ov5nF6Guk9fDNwkVmX7Whve148ccu/wscjS6hy0f/0oV+Z7JDxSkrcCnSggGfFz3Y6j
         JP5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZCV92CKxqUTmh2luLcrWlmgB95aX0BjK0dsaofOsc7jN8Y1JmpWW2A9/8KZzOsbWqFbzkfNM+z5u63ofblhi/MAtI150BaSx3Jx8vZg==
X-Gm-Message-State: AOJu0YzA3rdQC5i8JYYeLSVQlLc1hAb/tA2EshObayHVNkHG6mfURcrc
	XnjlcduUMnT4a1ZY/sLxH3GzC+wcCQ6ptpJU4SNn2Y76WaGmPGoHug0zGLomGII=
X-Google-Smtp-Source: AGHT+IE6xRkUNPoFSK1CMYVf6aFspHl1Y9GsmePQYoy8WjyDYLgF3VNtTwE9HjVn1d98SR896TG/JQ==
X-Received: by 2002:a17:90a:f190:b0:299:3c25:4248 with SMTP id bv16-20020a17090af19000b002993c254248mr910609pjb.38.1708671650519;
        Thu, 22 Feb 2024 23:00:50 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:45bd:34a3:d1ef:a1f3])
        by smtp.gmail.com with ESMTPSA id ck7-20020a17090afe0700b0029933f5b45dsm644162pjb.13.2024.02.22.23.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 23:00:50 -0800 (PST)
Date: Thu, 22 Feb 2024 23:00:46 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: "test_ip_fast_csum: ASSERTION FAILED at
 lib/checksum_kunit.c:589" at boot with CONFIG_CHECKSUM_KUNIT=y enabled on a
 Talos II, kernel 6.8-rc5
Message-ID: <ZdhCnoRu3i1Cnwks@ghost>
References: <20240223022654.625bef62@yea>
 <528c6abf-e5ef-42cd-a5d7-6ede3254523d@csgroup.eu>
 <Zdg3X4A1eJsJ+ACh@ghost>
 <6c37ffa2-8642-46c0-89ba-1f1e29b094d9@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c37ffa2-8642-46c0-89ba-1f1e29b094d9@csgroup.eu>
X-Mailman-Approved-At: Sat, 24 Feb 2024 22:42:55 +1100
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 23, 2024 at 06:58:14AM +0000, Christophe Leroy wrote:
> 
> 
> Le 23/02/2024 à 07:12, Charlie Jenkins a écrit :
> > On Fri, Feb 23, 2024 at 05:59:07AM +0000, Christophe Leroy wrote:
> >> Hi Erhard, hi Charlie,
> >>
> >> Le 23/02/2024 à 02:26, Erhard Furtner a écrit :
> >>> Greetings!
> >>>
> >>> Looks like my Talos II (running a BE kernel+system) fails some of the kernels internal unit tests. One of the failing tests is checksum_kunit, enabled via CONFIG_CHECKSUM_KUNIT=y:
> >>>
> >>> [...]
> >>>      KTAP version 1
> >>>       # Subtest: checksum
> >>>       # module: checksum_kunit
> >>>       1..5
> >>> entry-flush: disabled on command line.
> >>>       ok 1 test_csum_fixed_random_inputs
> >>>       ok 2 test_csum_all_carry_inputs
> >>>       ok 3 test_csum_no_carry_inputs
> >>>       # test_ip_fast_csum: ASSERTION FAILED at lib/checksum_kunit.c:589
> >>>       Expected ( u64)expected == ( u64)csum_result, but
> >>>           ( u64)expected == 55939 (0xda83)
> >>>           ( u64)csum_result == 33754 (0x83da)
> >>>       not ok 4 test_ip_fast_csum
> >>>       # test_csum_ipv6_magic: ASSERTION FAILED at lib/checksum_kunit.c:617
> >>>       Expected ( u64)expected_csum_ipv6_magic[i] == ( u64)csum_ipv6_magic(saddr, daddr, len, proto, csum), but
> >>>           ( u64)expected_csum_ipv6_magic[i] == 6356 (0x18d4)
> >>>           ( u64)csum_ipv6_magic(saddr, daddr, len, proto, csum) == 43586 (0xaa42)
> >>>       not ok 5 test_csum_ipv6_magic
> >>> # checksum: pass:3 fail:2 skip:0 total:5
> >>> # Totals: pass:3 fail:2 skip:0 total:5
> >>> not ok 4 checksum
> >>> [...]
> >>>
> >>> Full dmesg + kernel .config attached.
> >>
> >> Looks like the same problem as the one I fixed with commit b38460bc463c
> >> ("kunit: Fix checksum tests on big endian CPUs")
> >>
> >> The new tests implemented through commit 6f4c45cbcb00 ("kunit: Add tests
> >> for csum_ipv6_magic and ip_fast_csum") create a lot of type issues as
> >> reported by sparse when built with C=2 (see below).
> >>
> >> Once those issues are fixed, it should work.
> >>
> >> Charlie, can you provide a fix ?
> >>
> >> Thanks,
> >> Christophe
> > 
> > The "lib: checksum: Fix issues with checksum tests" patch should fix all of these issues [1].
> > 
> > [1] https://lore.kernel.org/all/20240221-fix_sparse_errors_checksum_tests-v9-1-bff4d73ab9d1@rivosinc.com/T/#m189783a9b2a7d12e3c34c4a412e65408658db2c9
> 
> It doesn't fix the issues, I still get the following with your patch 1/2 
> applied:
> 
> [    6.893141] KTAP version 1
> [    6.896118] 1..1
> [    6.897764]     KTAP version 1
> [    6.900800]     # Subtest: checksum
> [    6.904518]     # module: checksum_kunit
> [    6.904601]     1..5
> [    7.139784]     ok 1 test_csum_fixed_random_inputs
> [    7.590056]     ok 2 test_csum_all_carry_inputs
> [    8.064415]     ok 3 test_csum_no_carry_inputs
> [    8.070065]     # test_ip_fast_csum: ASSERTION FAILED at 
> lib/checksum_kunit.c:589
> [    8.070065]     Expected ( u64)expected == ( u64)csum_result, but
> [    8.070065]         ( u64)expected == 55939 (0xda83)
> [    8.070065]         ( u64)csum_result == 33754 (0x83da)
> [    8.075836]     not ok 4 test_ip_fast_csum
> [    8.101039]     # test_csum_ipv6_magic: ASSERTION FAILED at 
> lib/checksum_kunit.c:617
> [    8.101039]     Expected ( u64)( __sum16)expected_csum_ipv6_magic[i] 
> == ( u64)csum_ipv6_magic(saddr, daddr, len, proto, ( __wsum)csum), but
> [    8.101039]         ( u64)( __sum16)expected_csum_ipv6_magic[i] == 
> 6356 (0x18d4)
> [    8.101039]         ( u64)csum_ipv6_magic(saddr, daddr, len, proto, ( 
> __wsum)csum) == 43586 (0xaa42)
> [    8.106446]     not ok 5 test_csum_ipv6_magic
> [    8.143829] # checksum: pass:3 fail:2 skip:0 total:5
> [    8.148334] # Totals: pass:3 fail:2 skip:0 total:5
> [    8.153173] not ok 1 checksum
> 
> All your patch does is to hide the sparse warnings. But forcing a cast 
> doesn't fix byte orders.
> 
> Please have a look at commit b38460bc463c ("kunit: Fix checksum tests on 
> big endian CPUs"), there are helpers to put checksums in the correct 
> byte order.
> 
> Christophe

Well that's what the second patch is for. Is it failing with the second
patch applied?

- Charlie

