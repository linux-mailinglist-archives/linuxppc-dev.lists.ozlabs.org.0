Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 339C5B0386
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 20:23:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T9J8578kzF3rc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 04:23:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K7xqlKEd"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T9G74tPgzF3pr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 04:21:33 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id c10so4613887wmc.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 11:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5oTS8CESIdf2+fECzEqNsvb0NTpwnzCnNyq2GZVcr2Q=;
 b=K7xqlKEdOnfS0O9XRqb/0q0HY6V3p5QTtuFnmr0KhOwXtXTdrIo7XOMQjBPTztjdBv
 P2BkfFDusrYB3nUQH6LdVxrOILhGLcKVTvrwT0KVabE4tZPcmTOH+z27YSkrp56n/CPV
 I7tD8H8NX3WnSaIqV1wrz/S8P133nyn3cQZ9bTI0KlK5VXDAlwEdTrw3+xAn/nRxigzX
 oQFENDOvL6cAPWMpPTKZYx2roioydtwSveTu4Db+InkEQ552rK+aSTmjkAsDH6geR0fD
 TJRmFWw54E4ZULc2TLubi7PPT14jWff0OJuAZ6yo0rpSts5mEOMLrgoLLKQOIrILv8WI
 2TMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5oTS8CESIdf2+fECzEqNsvb0NTpwnzCnNyq2GZVcr2Q=;
 b=ii4GQ4EyDUdS4WQZzirzH9n9Ylv9RlmQSX+8Wo11JYpRvVHY3DGPzMgqCxqov1R4BS
 Bt8nunfJDedfUN2JwSJJBEHFkf7Pj5uBtLFtqlbRQVRDktiFnsvFqGc9nHxSsdZycJTP
 dyAXXnh/ldR+KCAeqkk/i6Xtb+qNQFRA64gkS+DSBLCudhbQi8zOLjb9r1UIRpZ3CRHF
 n87/5YQsVLf5HCiX19y43Vu1eWP1ezM28+YQkvLhJ+i+zzkmeg/5HYXIiZzdjvxyQP+c
 E+fGWz63AZWHavN17S0VljnBQqv4crYHRXzxVV6MdL5AEIZOea0qzUXeKccDwzVDlU4V
 asLw==
X-Gm-Message-State: APjAAAWwE3CUom7EMLcRcEpMC6lQOeAePsRwEZSfIasPsD/ujx6jk1Rt
 FVX6wHP89DCiOTjb+X623Fc=
X-Google-Smtp-Source: APXvYqzgU/fRnLbtz6RgedmNuEbJtbEeTdDWGVaZDP3OGyWMCl1pe8N23aR5qWBVV1G9Z0Q/VHcoyA==
X-Received: by 2002:a05:600c:2152:: with SMTP id
 v18mr5188852wml.177.1568226088230; 
 Wed, 11 Sep 2019 11:21:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id q9sm2356753wmq.15.2019.09.11.11.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 11:21:27 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 0/3] LLVM/Clang fixes for pseries_defconfig
Date: Wed, 11 Sep 2019 11:20:47 -0700
Message-Id: <20190911182049.77853-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: clang-built-linux@googlegroups.com,
 Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

This series includes a set of fixes for LLVM/Clang when building
pseries_defconfig. These have been floating around as standalone patches
so I decided to gather them up as a series so it was easier to
review/apply them. The versioning is a bit wonky because of this reason,
I have included the previous versions of the patches below as well as
added an explanation on each patch. Please let me know if there are any
comments or concerns.

Previous postings:

https://lore.kernel.org/lkml/20190818191321.58185-1-natechancellor@gmail.com/
https://lore.kernel.org/lkml/20190820232921.102673-1-natechancellor@gmail.com/
https://lore.kernel.org/lkml/20190812023214.107817-1-natechancellor@gmail.com/

Cheers,
Nathan
