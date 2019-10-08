Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC91DD0217
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 22:26:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46npm21HcpzDqQw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 07:26:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=emmanuel.nicolet@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J3H8ALxn"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nfTs5YLWzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 01:13:50 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id i16so3338716wmd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Oct 2019 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=FgUOFDNnc6WKmY6/exR4dvx4qmVnecgxnd7fH/x8UcE=;
 b=J3H8ALxnK6ShEFjev21xW5QZarvjBeVCoMAkc8iPxfaUf2SdVugD9Y6S2weFHjG+Zi
 0+nvOxU/DSbsb1KOoY7i/WXG3rZkqCLCo9hZqbK/DFTK4SdhXdASXpoW6AqsKVbZovP6
 mD+lDnTkHJ7Ai1OjapIPLO3heIN5MEN++H9Udk8iUdmwcSGN6KPopqQLRc6nxgLjg5e+
 isnsW5KCSN1vi8bbFu2fvwSf/KVv1TdNGnSwnypPzgtJi2b1BHTBFB6mtevpbsngKqtw
 w9PcYygYHDoPP87uLChBtucBUJH6mJAD3cbl8QVHlLxXPh/gf5w3I7zDm0ZtyyJQh557
 qshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=FgUOFDNnc6WKmY6/exR4dvx4qmVnecgxnd7fH/x8UcE=;
 b=Q6GEf9MRARlrijLJ3BLAdQNebwIy+0kSXi6h/zFIqKOaMnilGn7Pc7jjtY76swtr4c
 fuyJ9yOspVnsD3eoi075ImM4z8UAw6Yx2NOpC7Dhw+b+LgX1L09QNltnhYNQRFTyqu6t
 q0GYPyB7ZUdHIONxVrYqEf3dR1wzamDsabHY/zPO+weS9WbfYk8i1AvpbrWD1PKVQu7L
 qGmvigLcHRknhutHEigSCeSp48MHWZYdxotk5iCcY/g12neqprjhtS5064mCbHYaalGk
 GO/14BPGnX68JSG+ukqiRtWXsyBI4xNUJwZvHNyJI+7dcZe4lzvQxpDW8+V4cmvre7je
 0ZaQ==
X-Gm-Message-State: APjAAAUxfUDuWaKouldIN1+xpvcEWt0u7SC3GRGe0L50xaE6UJuYnHRP
 T2QKaPbmv8v2mpp2rTHWSXh37pOTE6w=
X-Google-Smtp-Source: APXvYqw0kFS2B0ds0qbi59OfUUeF/Mx0Ea9u6XEq64IZGrE2JR0Sc5lnWwOw8v2orcNTnirLfG0k5A==
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr3973756wmc.92.1570544025036; 
 Tue, 08 Oct 2019 07:13:45 -0700 (PDT)
Received: from gmail.com (227.177.125.78.rev.sfr.net. [78.125.177.227])
 by smtp.gmail.com with ESMTPSA id h63sm5270768wmf.15.2019.10.08.07.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 07:13:44 -0700 (PDT)
Date: Tue, 8 Oct 2019 16:13:42 +0200
From: Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
To: Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH] spufs: fix a crash in spufs_create_root()
Message-ID: <20191008141342.GA266797@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:25:10 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The spu_fs_context was not set in fc->fs_private, this caused a crash
when accessing ctx->mode in spufs_create_root().

Signed-off-by: Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
---
 arch/powerpc/platforms/cell/spufs/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 1d93e55a2de1..2dd452a047cd 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -761,6 +761,7 @@ static int spufs_init_fs_context(struct fs_context *fc)
 	ctx->gid = current_gid();
 	ctx->mode = 0755;
 
+	fc->fs_private = ctx;
 	fc->s_fs_info = sbi;
 	fc->ops = &spufs_context_ops;
 	return 0;
-- 
2.23.0

