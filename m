Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5A586249D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 12:43:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2epYWQX5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThlPw54xZz3vZT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 22:43:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=2epYWQX5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th06t6jtFz3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 17:12:53 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3bbbc6e51d0so332150b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 22:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708668771; x=1709273571; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6+FJvkA+NVSkLGrEb3ooS7zHjJgxV3a59zcKf7gWnfU=;
        b=2epYWQX528Jt1B6GmVWGscUIQTrgcCGpj5on2XRL41gPA+kZiCPVe17lxKetrHiP+g
         c3WC9HEsx4KsNH6u6x0p5dzzxuwnYI5WFoZveiURt5BtLyi+Db+E5Mhpto8oDtJDT5pc
         Aci0OpkhvC30KpiVIhhIDmQNvG6FxIE2NsCyw6M+RjcxmbzoYJlhXVLOeXrOHLcwAIPY
         ZgMBD2H67Ma0CpZRsrjaAhxAD5aiiW0L6v3M+Gp7nOdCDsg6ZQI1J+9z10OgwI7Csb5M
         oq5bWeDgykKi31+sEW8ZAmVIlDCbCdQBcmaBgZyHdHPkJMenxksr4UWYXImk71kcDwsT
         SzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708668771; x=1709273571;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+FJvkA+NVSkLGrEb3ooS7zHjJgxV3a59zcKf7gWnfU=;
        b=otl8Um9TztYNoHYCkOGIpoRNvjQjWHjY1HtW5vuuFZz6lL+kXiX9Hqf2lZy2n67mm3
         JGBqMYzeWGNbXI0JB6mJj4yFVH0xd7ybxUBmDPIPOZc/Z/TSv+hz/SGWePIt+1XCCfPC
         MTx4mF0VojPzG+K8TJM44NFaMYvVa4VgWGqghbzVYoI7KRGghE76F+oTu+PfBiPgpLXC
         uZGaQ61WBJ1Tbg/Fij9U8STZimOGQPQ85lg5EOPow30mD7eGEgm7jADHaJCNG2naBPDQ
         z4zzSMYfqzjXNYYwZnWMrq6b8KOg+t9Qv0sQmWnFhPuaxdd2wUGQa7WX0bbBq7igBwVU
         myag==
X-Forwarded-Encrypted: i=1; AJvYcCURjMV03D+8ty51u/9+cXzb0W+spzJYhTpIh82jqhnXMeWcY5WV0HUKzVTO+k7AKFiqFaSt7hOptDITes9l2awWC7jgX76MdSfN3Amb9g==
X-Gm-Message-State: AOJu0YxNTby7hclgswgwEPXYEiMejGaYu2AR8Dm5vsDwVi6ApjblFi/I
	+fxOxyqArof+LBlECXTPBfY72wUAmcDWDVsXtfewR2o5IXkZKdkKCewExLY6Nbk=
X-Google-Smtp-Source: AGHT+IHUtkjy8HubvTxCVo97IUEI7MplXA9430ueGwfeXj+aUWemSwJjYDBA6cZQ6qiESsI8IKp2Og==
X-Received: by 2002:a05:6358:340b:b0:17b:6391:1136 with SMTP id h11-20020a056358340b00b0017b63911136mr903683rwd.17.1708668770829;
        Thu, 22 Feb 2024 22:12:50 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:aede:c20c:3775:da4a])
        by smtp.gmail.com with ESMTPSA id s27-20020a056a00179b00b006e3cdae7e60sm10494407pfg.58.2024.02.22.22.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 22:12:50 -0800 (PST)
Date: Thu, 22 Feb 2024 22:12:47 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: "test_ip_fast_csum: ASSERTION FAILED at
 lib/checksum_kunit.c:589" at boot with CONFIG_CHECKSUM_KUNIT=y enabled on a
 Talos II, kernel 6.8-rc5
Message-ID: <Zdg3X4A1eJsJ+ACh@ghost>
References: <20240223022654.625bef62@yea>
 <528c6abf-e5ef-42cd-a5d7-6ede3254523d@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <528c6abf-e5ef-42cd-a5d7-6ede3254523d@csgroup.eu>
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

On Fri, Feb 23, 2024 at 05:59:07AM +0000, Christophe Leroy wrote:
> Hi Erhard, hi Charlie,
> 
> Le 23/02/2024 à 02:26, Erhard Furtner a écrit :
> > Greetings!
> > 
> > Looks like my Talos II (running a BE kernel+system) fails some of the kernels internal unit tests. One of the failing tests is checksum_kunit, enabled via CONFIG_CHECKSUM_KUNIT=y:
> > 
> > [...]
> >     KTAP version 1
> >      # Subtest: checksum
> >      # module: checksum_kunit
> >      1..5
> > entry-flush: disabled on command line.
> >      ok 1 test_csum_fixed_random_inputs
> >      ok 2 test_csum_all_carry_inputs
> >      ok 3 test_csum_no_carry_inputs
> >      # test_ip_fast_csum: ASSERTION FAILED at lib/checksum_kunit.c:589
> >      Expected ( u64)expected == ( u64)csum_result, but
> >          ( u64)expected == 55939 (0xda83)
> >          ( u64)csum_result == 33754 (0x83da)
> >      not ok 4 test_ip_fast_csum
> >      # test_csum_ipv6_magic: ASSERTION FAILED at lib/checksum_kunit.c:617
> >      Expected ( u64)expected_csum_ipv6_magic[i] == ( u64)csum_ipv6_magic(saddr, daddr, len, proto, csum), but
> >          ( u64)expected_csum_ipv6_magic[i] == 6356 (0x18d4)
> >          ( u64)csum_ipv6_magic(saddr, daddr, len, proto, csum) == 43586 (0xaa42)
> >      not ok 5 test_csum_ipv6_magic
> > # checksum: pass:3 fail:2 skip:0 total:5
> > # Totals: pass:3 fail:2 skip:0 total:5
> > not ok 4 checksum
> > [...]
> > 
> > Full dmesg + kernel .config attached.
> 
> Looks like the same problem as the one I fixed with commit b38460bc463c 
> ("kunit: Fix checksum tests on big endian CPUs")
> 
> The new tests implemented through commit 6f4c45cbcb00 ("kunit: Add tests 
> for csum_ipv6_magic and ip_fast_csum") create a lot of type issues as 
> reported by sparse when built with C=2 (see below).
> 
> Once those issues are fixed, it should work.
> 
> Charlie, can you provide a fix ?
> 
> Thanks,
> Christophe

The "lib: checksum: Fix issues with checksum tests" patch should fix all of these issues [1].

[1] https://lore.kernel.org/all/20240221-fix_sparse_errors_checksum_tests-v9-1-bff4d73ab9d1@rivosinc.com/T/#m189783a9b2a7d12e3c34c4a412e65408658db2c9

- Charlie

> 
>    CC      lib/checksum_kunit.o
>    CHECK   lib/checksum_kunit.c
> lib/checksum_kunit.c:219:9: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:219:9:    expected restricted __sum16
> lib/checksum_kunit.c:219:9:    got int
> lib/checksum_kunit.c:219:17: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:219:17:    expected restricted __sum16
> lib/checksum_kunit.c:219:17:    got int
> lib/checksum_kunit.c:219:25: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:219:25:    expected restricted __sum16
> lib/checksum_kunit.c:219:25:    got int
> lib/checksum_kunit.c:219:33: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:219:33:    expected restricted __sum16
> lib/checksum_kunit.c:219:33:    got int
> lib/checksum_kunit.c:219:41: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:219:41:    expected restricted __sum16
> lib/checksum_kunit.c:219:41:    got int
> lib/checksum_kunit.c:219:49: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:219:49:    expected restricted __sum16
> lib/checksum_kunit.c:219:49:    got int
> lib/checksum_kunit.c:219:57: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:219:57:    expected restricted __sum16
> lib/checksum_kunit.c:219:57:    got int
> lib/checksum_kunit.c:219:65: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:219:65:    expected restricted __sum16
> lib/checksum_kunit.c:219:65:    got int
> lib/checksum_kunit.c:219:73: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:219:73:    expected restricted __sum16
> lib/checksum_kunit.c:219:73:    got int
> lib/checksum_kunit.c:220:9: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:220:9:    expected restricted __sum16
> lib/checksum_kunit.c:220:9:    got int
> lib/checksum_kunit.c:220:17: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:220:17:    expected restricted __sum16
> lib/checksum_kunit.c:220:17:    got int
> lib/checksum_kunit.c:220:25: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:220:25:    expected restricted __sum16
> lib/checksum_kunit.c:220:25:    got int
> lib/checksum_kunit.c:220:33: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:220:33:    expected restricted __sum16
> lib/checksum_kunit.c:220:33:    got int
> lib/checksum_kunit.c:220:41: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:220:41:    expected restricted __sum16
> lib/checksum_kunit.c:220:41:    got int
> lib/checksum_kunit.c:220:49: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:220:49:    expected restricted __sum16
> lib/checksum_kunit.c:220:49:    got int
> lib/checksum_kunit.c:220:57: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:220:57:    expected restricted __sum16
> lib/checksum_kunit.c:220:57:    got int
> lib/checksum_kunit.c:220:65: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:220:65:    expected restricted __sum16
> lib/checksum_kunit.c:220:65:    got int
> lib/checksum_kunit.c:220:73: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:220:73:    expected restricted __sum16
> lib/checksum_kunit.c:220:73:    got int
> lib/checksum_kunit.c:221:9: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:221:9:    expected restricted __sum16
> lib/checksum_kunit.c:221:9:    got int
> lib/checksum_kunit.c:221:17: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:221:17:    expected restricted __sum16
> lib/checksum_kunit.c:221:17:    got int
> lib/checksum_kunit.c:221:25: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:221:25:    expected restricted __sum16
> lib/checksum_kunit.c:221:25:    got int
> lib/checksum_kunit.c:221:33: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:221:33:    expected restricted __sum16
> lib/checksum_kunit.c:221:33:    got int
> lib/checksum_kunit.c:221:41: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:221:41:    expected restricted __sum16
> lib/checksum_kunit.c:221:41:    got int
> lib/checksum_kunit.c:221:49: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:221:49:    expected restricted __sum16
> lib/checksum_kunit.c:221:49:    got int
> lib/checksum_kunit.c:221:57: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:221:57:    expected restricted __sum16
> lib/checksum_kunit.c:221:57:    got int
> lib/checksum_kunit.c:221:65: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:221:65:    expected restricted __sum16
> lib/checksum_kunit.c:221:65:    got int
> lib/checksum_kunit.c:221:73: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:221:73:    expected restricted __sum16
> lib/checksum_kunit.c:221:73:    got int
> lib/checksum_kunit.c:222:9: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:222:9:    expected restricted __sum16
> lib/checksum_kunit.c:222:9:    got int
> lib/checksum_kunit.c:222:17: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:222:17:    expected restricted __sum16
> lib/checksum_kunit.c:222:17:    got int
> lib/checksum_kunit.c:222:25: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:222:25:    expected restricted __sum16
> lib/checksum_kunit.c:222:25:    got int
> lib/checksum_kunit.c:222:33: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:222:33:    expected restricted __sum16
> lib/checksum_kunit.c:222:33:    got int
> lib/checksum_kunit.c:222:41: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:222:41:    expected restricted __sum16
> lib/checksum_kunit.c:222:41:    got int
> lib/checksum_kunit.c:222:49: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:222:49:    expected restricted __sum16
> lib/checksum_kunit.c:222:49:    got int
> lib/checksum_kunit.c:222:57: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:222:57:    expected restricted __sum16
> lib/checksum_kunit.c:222:57:    got int
> lib/checksum_kunit.c:222:65: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:222:65:    expected restricted __sum16
> lib/checksum_kunit.c:222:65:    got int
> lib/checksum_kunit.c:222:73: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:222:73:    expected restricted __sum16
> lib/checksum_kunit.c:222:73:    got int
> lib/checksum_kunit.c:223:9: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:223:9:    expected restricted __sum16
> lib/checksum_kunit.c:223:9:    got int
> lib/checksum_kunit.c:223:17: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:223:17:    expected restricted __sum16
> lib/checksum_kunit.c:223:17:    got int
> lib/checksum_kunit.c:223:25: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:223:25:    expected restricted __sum16
> lib/checksum_kunit.c:223:25:    got int
> lib/checksum_kunit.c:223:33: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:223:33:    expected restricted __sum16
> lib/checksum_kunit.c:223:33:    got int
> lib/checksum_kunit.c:223:41: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:223:41:    expected restricted __sum16
> lib/checksum_kunit.c:223:41:    got int
> lib/checksum_kunit.c:223:49: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:223:49:    expected restricted __sum16
> lib/checksum_kunit.c:223:49:    got int
> lib/checksum_kunit.c:223:57: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:223:57:    expected restricted __sum16
> lib/checksum_kunit.c:223:57:    got int
> lib/checksum_kunit.c:223:65: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:223:65:    expected restricted __sum16
> lib/checksum_kunit.c:223:65:    got int
> lib/checksum_kunit.c:223:73: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:223:73:    expected restricted __sum16
> lib/checksum_kunit.c:223:73:    got int
> lib/checksum_kunit.c:224:9: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:224:9:    expected restricted __sum16
> lib/checksum_kunit.c:224:9:    got int
> lib/checksum_kunit.c:224:17: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:224:17:    expected restricted __sum16
> lib/checksum_kunit.c:224:17:    got int
> lib/checksum_kunit.c:224:25: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:224:25:    expected restricted __sum16
> lib/checksum_kunit.c:224:25:    got int
> lib/checksum_kunit.c:224:33: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:224:33:    expected restricted __sum16
> lib/checksum_kunit.c:224:33:    got int
> lib/checksum_kunit.c:224:41: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:224:41:    expected restricted __sum16
> lib/checksum_kunit.c:224:41:    got int
> lib/checksum_kunit.c:224:49: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:224:49:    expected restricted __sum16
> lib/checksum_kunit.c:224:49:    got int
> lib/checksum_kunit.c:224:57: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:224:57:    expected restricted __sum16
> lib/checksum_kunit.c:224:57:    got int
> lib/checksum_kunit.c:224:65: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:224:65:    expected restricted __sum16
> lib/checksum_kunit.c:224:65:    got int
> lib/checksum_kunit.c:224:73: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:224:73:    expected restricted __sum16
> lib/checksum_kunit.c:224:73:    got int
> lib/checksum_kunit.c:225:9: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:225:9:    expected restricted __sum16
> lib/checksum_kunit.c:225:9:    got int
> lib/checksum_kunit.c:225:17: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:225:17:    expected restricted __sum16
> lib/checksum_kunit.c:225:17:    got int
> lib/checksum_kunit.c:225:25: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:225:25:    expected restricted __sum16
> lib/checksum_kunit.c:225:25:    got int
> lib/checksum_kunit.c:225:33: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:225:33:    expected restricted __sum16
> lib/checksum_kunit.c:225:33:    got int
> lib/checksum_kunit.c:225:41: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:225:41:    expected restricted __sum16
> lib/checksum_kunit.c:225:41:    got int
> lib/checksum_kunit.c:225:49: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:225:49:    expected restricted __sum16
> lib/checksum_kunit.c:225:49:    got int
> lib/checksum_kunit.c:225:57: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:225:57:    expected restricted __sum16
> lib/checksum_kunit.c:225:57:    got int
> lib/checksum_kunit.c:225:65: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:225:65:    expected restricted __sum16
> lib/checksum_kunit.c:225:65:    got int
> lib/checksum_kunit.c:225:73: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:225:73:    expected restricted __sum16
> lib/checksum_kunit.c:225:73:    got int
> lib/checksum_kunit.c:226:9: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:226:9:    expected restricted __sum16
> lib/checksum_kunit.c:226:9:    got int
> lib/checksum_kunit.c:226:17: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:226:17:    expected restricted __sum16
> lib/checksum_kunit.c:226:17:    got int
> lib/checksum_kunit.c:226:25: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:226:25:    expected restricted __sum16
> lib/checksum_kunit.c:226:25:    got int
> lib/checksum_kunit.c:226:33: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:226:33:    expected restricted __sum16
> lib/checksum_kunit.c:226:33:    got int
> lib/checksum_kunit.c:226:41: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:226:41:    expected restricted __sum16
> lib/checksum_kunit.c:226:41:    got int
> lib/checksum_kunit.c:226:49: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:226:49:    expected restricted __sum16
> lib/checksum_kunit.c:226:49:    got int
> lib/checksum_kunit.c:226:57: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:226:57:    expected restricted __sum16
> lib/checksum_kunit.c:226:57:    got int
> lib/checksum_kunit.c:226:65: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:226:65:    expected restricted __sum16
> lib/checksum_kunit.c:226:65:    got int
> lib/checksum_kunit.c:226:73: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:226:73:    expected restricted __sum16
> lib/checksum_kunit.c:226:73:    got int
> lib/checksum_kunit.c:227:9: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:227:9:    expected restricted __sum16
> lib/checksum_kunit.c:227:9:    got int
> lib/checksum_kunit.c:227:17: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:227:17:    expected restricted __sum16
> lib/checksum_kunit.c:227:17:    got int
> lib/checksum_kunit.c:227:25: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:227:25:    expected restricted __sum16
> lib/checksum_kunit.c:227:25:    got int
> lib/checksum_kunit.c:227:33: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:227:33:    expected restricted __sum16
> lib/checksum_kunit.c:227:33:    got int
> lib/checksum_kunit.c:227:41: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:227:41:    expected restricted __sum16
> lib/checksum_kunit.c:227:41:    got int
> lib/checksum_kunit.c:227:49: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:227:49:    expected restricted __sum16
> lib/checksum_kunit.c:227:49:    got int
> lib/checksum_kunit.c:227:57: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:227:57:    expected restricted __sum16
> lib/checksum_kunit.c:227:57:    got int
> lib/checksum_kunit.c:227:65: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:227:65:    expected restricted __sum16
> lib/checksum_kunit.c:227:65:    got int
> lib/checksum_kunit.c:227:73: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:227:73:    expected restricted __sum16
> lib/checksum_kunit.c:227:73:    got int
> lib/checksum_kunit.c:228:9: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:228:9:    expected restricted __sum16
> lib/checksum_kunit.c:228:9:    got int
> lib/checksum_kunit.c:228:17: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:228:17:    expected restricted __sum16
> lib/checksum_kunit.c:228:17:    got int
> lib/checksum_kunit.c:228:25: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:228:25:    expected restricted __sum16
> lib/checksum_kunit.c:228:25:    got int
> lib/checksum_kunit.c:228:33: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:228:33:    expected restricted __sum16
> lib/checksum_kunit.c:228:33:    got int
> lib/checksum_kunit.c:228:41: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:228:41:    expected restricted __sum16
> lib/checksum_kunit.c:228:41:    got int
> lib/checksum_kunit.c:228:49: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:228:49:    expected restricted __sum16
> lib/checksum_kunit.c:228:49:    got int
> lib/checksum_kunit.c:228:57: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:228:57:    expected restricted __sum16
> lib/checksum_kunit.c:228:57:    got int
> lib/checksum_kunit.c:228:65: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:228:65:    expected restricted __sum16
> lib/checksum_kunit.c:228:65:    got int
> lib/checksum_kunit.c:228:73: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:228:73:    expected restricted __sum16
> lib/checksum_kunit.c:228:73:    got int
> lib/checksum_kunit.c:229:9: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:229:9:    expected restricted __sum16
> lib/checksum_kunit.c:229:9:    got int
> lib/checksum_kunit.c:229:17: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:229:17:    expected restricted __sum16
> lib/checksum_kunit.c:229:17:    got int
> lib/checksum_kunit.c:229:25: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:229:25:    expected restricted __sum16
> lib/checksum_kunit.c:229:25:    got int
> lib/checksum_kunit.c:229:33: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:229:33:    expected restricted __sum16
> lib/checksum_kunit.c:229:33:    got int
> lib/checksum_kunit.c:229:41: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:229:41:    expected restricted __sum16
> lib/checksum_kunit.c:229:41:    got int
> lib/checksum_kunit.c:229:49: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:229:49:    expected restricted __sum16
> lib/checksum_kunit.c:229:49:    got int
> lib/checksum_kunit.c:229:57: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:229:57:    expected restricted __sum16
> lib/checksum_kunit.c:229:57:    got int
> lib/checksum_kunit.c:229:65: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:229:65:    expected restricted __sum16
> lib/checksum_kunit.c:229:65:    got int
> lib/checksum_kunit.c:229:73: warning: incorrect type in initializer 
> (different base types)
> lib/checksum_kunit.c:229:73:    expected restricted __sum16
> lib/checksum_kunit.c:229:73:    got int
> lib/checksum_kunit.c:230:9: warning: too many warnings
