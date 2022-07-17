Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6565773B3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 05:28:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlrCN3khdz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 13:28:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aeXw4SZL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aeXw4SZL;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LlrBh5R0Nz305c
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 13:27:39 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id l12so6321975plk.13
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 20:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=NBRPKTA2TVmxc9QPQeqKJ56d/+3FAMBPvBKl+2Xs87o=;
        b=aeXw4SZLmPAh+BWFYg7vSBTNkt+8maz/6V3+YAO+hcXWkEOJjpRfQJ3Q0juzXIuajq
         YD5nxyfB2HWlT4KxcYITS+Rg5HA6Qbj77YlkF2CF9+r2+fGBMQKXi0/YtHI69fKsjCJE
         0KiqAmash26aKDdg6NOltfT19D69Vl9ncSJviqoFAHsvuG1tSXx7aHSQfhJbDSSmfaoE
         gcX5sJgXry1gg6nlX/UJ6vuVjFT+pArs+WoybBE//rJhCPZK4X+Q807yujgtwQ7hrx/4
         SU8KNOC6StbEMkUWPRVACPWEcTP16gJfqzDdLq3LYZCBAiBK3wwuxpS91qFXsHleBZ1o
         KzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=NBRPKTA2TVmxc9QPQeqKJ56d/+3FAMBPvBKl+2Xs87o=;
        b=4CkjAp/Adu225dm0XDo04Ln3I0fEOmDxji4qp+TALtpGs0KMXqvg5nyu+P02485Kkf
         ALzmzzeLsm58j4mzwDgeoYzLOe9TKZfa2Wd8b4DEdFTxuGtkiB4xis5mEusKQFkrRkH/
         DMgzdtnyy6LgjqNLGZP8vAPMdzGq2nPwIHnq5NSrxPclGL2PPjUbraTKRr4X1ELTtfHA
         XAQN+IbnN9V/xnSjMMEB4s0ght6ZoykR32a/9XYzZIjzF1rFDDkvIA3zyGArp+IKhCBg
         tw3MsZsPIJjhiyOitPiBozYVmCjakRyyssLyzYEwfcZfDTTbOLQuP51LBKxxe/wftN/a
         ti7w==
X-Gm-Message-State: AJIora/UNEirGRERKMqbkV399FDNZkrg7TsRQbx68sae4SWKOLncW5Nk
	b+uDQDb+pMve2PSko3YGZlg=
X-Google-Smtp-Source: AGRyM1uDCrblu7+K6IRjnfP1hNo16ztJa/KIdjyX64EOFy+HLILXk7X3BywAviUKC4BK9zFOCDJj+A==
X-Received: by 2002:a17:90b:3811:b0:1ef:d704:24cf with SMTP id mq17-20020a17090b381100b001efd70424cfmr24460035pjb.14.1658028455563;
        Sat, 16 Jul 2022 20:27:35 -0700 (PDT)
Received: from debian.me (subs09a-223-255-225-66.three.co.id. [223.255.225.66])
        by smtp.gmail.com with ESMTPSA id k6-20020aa79986000000b00528c22038f5sm6833189pfh.14.2022.07.16.20.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:27:35 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 5E20F10008F; Sun, 17 Jul 2022 10:27:30 +0700 (WIB)
Date: Sun, 17 Jul 2022 10:27:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: next-20220715 build fail due to 579b9239c1f386 (powerpc,
 ps3_defconfig, GCC 12.1.0)
Message-ID: <YtOBoh6MEtJmJ+g5@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi everyone,

I built next-20220715 tree, using powerpc64-unknown-linux-gnu-gcc
(GCC 12.1.0) and ps3_defconfig. The build errored on W=1 build
(-Werror=missing-prototypes):

  CC      arch/powerpc/mm/book3s64/pgtable.o
  CC      arch/powerpc/kernel/process.o
arch/powerpc/mm/book3s64/pgtable.c:478:5: error: no previous prototype for 'pmd_move_must_withdraw' [-Werror=missing-prototypes]
  478 | int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
      |     ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

The errored line is introduced by commit 579b9239c1f386 ("powerpc/radix: Fix
kernel crash with mremap()")

Looking at the commit, it seems like GCC didn't see the prototype which had
already been given, or am I missing something?

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
