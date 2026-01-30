Return-Path: <linuxppc-dev+bounces-16463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEZ0KRzlfGkwPQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 18:06:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5F6BCD0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 18:06:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2j8l1N2xz2xWJ;
	Sat, 31 Jan 2026 04:06:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::342"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769792791;
	cv=none; b=klOPw/TXUuRjDODPq61Xs0mq7iRgcnlLoTIlIIEUu6lvz0Bwl1vpdDZ5hnBrmOP6ZSw1zIEnXAJMza83CH6fBcOS4UUBbjgBJ7ZDB85Bomw7/vO+kq7Jh+ilg658vkMo0OXX/D++rCjuQ9QlRNxcG4q6sEbvJwEwSe0PHzE92RjOh9EG5fxojojQpvoNviHHO5pz7CRzItYVx3dZ3cYWwVcz4JePRsQqWGmUwtXVQBGjoqtY+8Z423pmzzzJhweePGe3jPhZ6dmVCd/Hvhjqa80XfYrDsOslpk5FgWi6dqyXuZo9PMEnwnxYJhsaL/eOEI/ZcZ/qsmOPi1LxAXJotA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769792791; c=relaxed/relaxed;
	bh=IMJORWzmOlpEqP661qXUzTKVdV68wRwU7CbPE5NG1tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfa984z4BZb/1Ea/kgl2DgXBJxTGUTISDK9W//w4+ScAmhY7UdUv/ubMU0G1+rDZM0p96OqhOl3/KbVnHw3PRlBlzqtF49olHJz7jBR118TvcqVX065nmgmHqwNRy61vJ9NFqI9SDl1ogsa58eLo5VCt4320EXH5as43VGDUUbol5Zn5TcyCx1qTFmYbRepnfspxWsjqEyPTJ3an9Jcyn+BDWKg2IZ52/hEPiAuzp/KlB/yHj24vyt+lqKCOxS4jnYbX95RhvTg0q0VmcbNkX/mGwT9w1eibrUfMxcu8XtCtqJU0OXfNGTp9468XgL53ucwl0QW3P9kQw9q+xll1MA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cc9EGA+y; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com; envelope-from=petr.pavlu@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cc9EGA+y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com; envelope-from=petr.pavlu@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2j8h3r2lz2xPW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 04:06:27 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4806f9e61f9so12506765e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 09:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769792782; x=1770397582; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IMJORWzmOlpEqP661qXUzTKVdV68wRwU7CbPE5NG1tY=;
        b=cc9EGA+yTue37gNJg4m5pMfOP71BNugDvdNGuxaKLq6xtZvceJCPwPv3E00F3lob0n
         6dm7zE0fFMi3cPvAbaJkxNXb4EfxjAVfckJyDgmlOhQHu0qYdxsl6/oJ/Fgdn2mB9GtR
         cmLbsVpJWf4X3c2inyGAGE+Bg84G3jhK8WwfalySDb9w5+wT8B3JCelMedZcjeANzzbH
         F78WJXZE1ViXrEc333PNOxE5yO63subDaifFhedaDE9wt0Hp4wCCpun1WnaTlSevEHyS
         y6a0y3gbrp2GlEIor4sHG3oJQlRd7PfFrd0SFjUJ2S3AqAt+i9FpsHTtJDZ5aQKCCNKC
         o0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769792782; x=1770397582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMJORWzmOlpEqP661qXUzTKVdV68wRwU7CbPE5NG1tY=;
        b=NmKfybgX9mMdPr5DDnTJdHx3fxriZu/tRxHauz0zdfKO9rvPyKZRGAxaBVu486i/se
         UMtsFispLhcXH5jHcDZHlUMRqQanrIQOBqIzLen13LzaCysakPP3eila6/PpOOC2mkY9
         FrmYnyZQDfpWFvv0eZQPFSfduaoCwyK4oCpsNxmmGjx/CMuSZoEnAv/qVpruAeNW51gx
         c9dsyn3VVjpKJg5+1/xMYiz9dtEIP/RqsHYoJ5u5WDstQFv+YAocnSV7cp8UXxMg4K+L
         Pbgb+ecy0Ynw247fFDPygr+AYxYYgR3aBATkV4MlroVXT9C9wVobOMBaFdf+W4uFlTm6
         kcEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcJNy5/n26ye1GHlMAk9jfU5Io+21fqnYi8644LCXAwVr3BQl9gs7zrKpCcqkBK62SfoLHhvJPIFG9l90=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyc4bvz1j4h2UEzXzAa/DksXHNaPpfXw9IrXV5uWHXrwIhOnAiN
	WnxlwC0dXaUL6SlQ0DjE0WUePFkyB7vfH/vNHkE86r9usPVW8fBffm2KxrEkKnRM4ww=
X-Gm-Gg: AZuq6aKUz7uZT7Ygq0TobHOz7s77Zkhoj8NnbRrt6+PjmfE3SC1RYg5i2QTgiE7bzoa
	Ivg7f4X320eaVdlNPUdNQv0FWnyquseKsNYU0Ks7hImUdLpOvO70jJCKd23wnXUy55oFACAijvJ
	NPlv30LF1JLC6B0rLJ1p1fWdd6iBB8JocIk7fxz5VYP/hFIBGmN3MmL9zx0PffVR0vLp3RxrTZw
	6rIVDA6WZI6RGuktkIhst71ydJeiDSGn/buh0kMOEiFrF/UZzGmciJfe594MjcTLsrvVeThsnJj
	HYuB0w/6/4EJuGUinE1PfdvQ0KttANWCNv2oZ8BFU00Y/lUpHnU9XeH3CMFo9y2KCdfTzMe1fHi
	852EyLOCo3yttdD7xIT3SL09PGZVQrvIrAQQfJ9Ua0EPCBaFAhbPECoF8BroLU/3Hx9sVQ7PaGF
	txGTRNfMRdt6mPJC+zx6/4p6k5xfkarw==
X-Received: by 2002:a05:600c:1385:b0:480:4d76:daf0 with SMTP id 5b1f17b1804b1-482db49e8b9mr41644875e9.37.1769792782094;
        Fri, 30 Jan 2026 09:06:22 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e047d863sm21561025e9.1.2026.01.30.09.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 09:06:21 -0800 (PST)
Message-ID: <db1ed045-d7b6-49dc-b111-9fea7c30f8ab@suse.com>
Date: Fri, 30 Jan 2026 18:06:20 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/17] module: Introduce hash-based integrity checking
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Xiu Jianfeng <xiujianfeng@huawei.com>,
 =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>,
 Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>,
 kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>,
 =?UTF-8?Q?C=C3=A2ju_Mihai-Drosi?= <mcaju95@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <20260113-module-hashes-v4-15-0b932db9b56b@weissschuh.net>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260113-module-hashes-v4-15-0b932db9b56b@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16463-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:nathan@kernel.org,m:arnd@arndb.de,m:mcgrof@kernel.org,m:samitolvanen@google.com,m:da.gomez@samsung.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:naveen@kernel.org,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:nicolas.schier@linux.dev,m:da.gomez@kernel.org,m:atomlin@atomlin.com,m:chleroy@kernel.org,m:nsc@kernel.org,m:nicolas.bouchinet@oss.cyber.gouv.fr,m:xiujianfeng@huawei.com,m:f.gruenbichler@proxmox.com,m:arnout@bzzt.net,m:mattia@mapreri.org,m:kpcyrd@archlinux.org,m:christian@heusel.eu,m:mcaju95@gmail.com,m:bigeasy@linutronix.de,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-integrity@vger.kerne
 l.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,google.com,samsung.com,paul-moore.com,namei.org,hallyn.com,lwn.net,linux.ibm.com,ellerman.id.au,gmail.com,huawei.com,oracle.com,linux.dev,atomlin.com,oss.cyber.gouv.fr,proxmox.com,bzzt.net,mapreri.org,archlinux.org,heusel.eu,linutronix.de,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[petr.pavlu@suse.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9F5F6BCD0E
X-Rspamd-Action: no action

On 1/13/26 1:28 PM, Thomas Weißschuh wrote:
> Normally the .ko module files depend on a fully built vmlinux to be
> available for modpost validation and BTF generation. With
> CONFIG_MODULE_HASHES, vmlinux now depends on the modules
> to build a merkle tree. This introduces a dependency cycle which is
> impossible to satisfy. Work around this by building the modules during
> link-vmlinux.sh, after vmlinux is complete enough for modpost and BTF
> but before the final module hashes are

I wonder if this dependency cycle could be resolved by utilizing the
split into vmlinux.unstripped and vmlinux that occurred last year.

The idea is to create the following ordering: vmlinux.unstripped ->
modules -> vmlinux, and to patch in .module_hashes only when building
the final vmlinux.

This would require the following:
* Split scripts/Makefile.vmlinux into two Makefiles, one that builds the
  current vmlinux.unstripped and the second one that builds the final
  vmlinux from it.
* Modify the top Makefile to recognize vmlinux.unstripped and update the
  BTF generation rule 'modules: vmlinux' to
  'modules: vmlinux.unstripped'.
* Add the 'vmlinux: modules' ordering in the top Makefile for
  CONFIG_MODULE_HASHES=y.
* Remove the patching of vmlinux.unstripped in scripts/link-vmlinux.sh
  and instead move it into scripts/Makefile.vmlinux when running objcopy
  to produce the final vmlinux.

I think this approach has two main advantages:
* CONFIG_MODULE_HASHES can be made orthogonal to
  CONFIG_DEBUG_INFO_BTF_MODULES.
* All dependencies are expressed at the Makefile level instead of having
  scripts/link-vmlinux.sh invoke 'make -f Makefile modules'.

Below is a rough prototype that applies on top of this series. It is a
bit verbose due to the splitting of part of scripts/Makefile.vmlinux
into scripts/Makefile.vmlinux_unstripped.

-- 
Thanks,
Petr


diff --git a/Makefile b/Makefile
index 841772a5a260..19a3beb82fa7 100644
--- a/Makefile
+++ b/Makefile
@@ -1259,7 +1259,7 @@ vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
 vmlinux.o modules.builtin.modinfo modules.builtin: vmlinux_o
 	@:
 
-PHONY += vmlinux
+PHONY += vmlinux.unstripped vmlinux
 # LDFLAGS_vmlinux in the top Makefile defines linker flags for the top vmlinux,
 # not for decompressors. LDFLAGS_vmlinux in arch/*/boot/compressed/Makefile is
 # unrelated; the decompressors just happen to have the same base name,
@@ -1270,9 +1270,11 @@ PHONY += vmlinux
 #   https://savannah.gnu.org/bugs/?61463
 # For Make > 4.4, the following simple code will work:
 #  vmlinux: private export LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
-vmlinux: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
-vmlinux: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
-vmlinux: vmlinux.o $(KBUILD_LDS) modpost
+vmlinux.unstripped: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
+vmlinux.unstripped: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
+vmlinux.unstripped: vmlinux.o $(KBUILD_LDS) modpost
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_unstripped
+vmlinux: vmlinux.unstripped
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux
 
 # The actual objects are generated when descending,
@@ -1541,7 +1543,7 @@ all: dtbs
 endif
 
 ifdef CONFIG_GENERIC_BUILTIN_DTB
-vmlinux: dtbs
+vmlinux.unstripped: dtbs
 endif
 
 endif
@@ -1588,9 +1590,11 @@ endif
 # is an exception.
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 KBUILD_BUILTIN := y
-ifndef CONFIG_MODULE_HASHES
-modules: vmlinux
+modules: vmlinux.unstripped
 endif
+
+ifdef CONFIG_MODULE_HASHES
+vmlinux: modules
 endif
 
 modules: modules_prepare
@@ -1983,11 +1987,7 @@ modules.order: $(build-dir)
 # KBUILD_MODPOST_NOFINAL can be set to skip the final link of modules.
 # This is solely useful to speed up test compiles.
 modules: modpost
-ifdef CONFIG_MODULE_HASHES
-ifeq ($(MODULE_HASHES_MODPOST_FINAL), 1)
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
-endif
-else ifneq ($(KBUILD_MODPOST_NOFINAL),1)
+ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
 endif
 
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 890724edac69..213e21ecfe0d 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -55,7 +55,7 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 	$(cmd);                                                              \
 	printf '%s\n' 'savedcmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
-# Re-generate module BTFs if either module's .ko or vmlinux changed
+# Re-generate module BTFs if either module's .ko or vmlinux.unstripped changed
 %.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/.tmp_vmlinux_btf.stamp) FORCE
 	+$(call if_changed_except,ld_ko_o,$(objtree)/.tmp_vmlinux_btf.stamp)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 4ce849f6253a..8c2a938c88ab 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -15,78 +15,24 @@ targets :=
 %.o: %.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-# Built-in dtb
-# ---------------------------------------------------------------------------
-
-quiet_cmd_wrap_dtbs = WRAP    $@
-      cmd_wrap_dtbs = {							\
-	echo '\#include <asm-generic/vmlinux.lds.h>';			\
-	echo '.section .dtb.init.rodata,"a"';				\
-	while read dtb; do						\
-		symbase=__dtb_$$(basename -s .dtb "$${dtb}" | tr - _);	\
-		echo '.balign STRUCT_ALIGNMENT';			\
-		echo ".global $${symbase}_begin";			\
-		echo "$${symbase}_begin:";				\
-		echo '.incbin "'$$dtb'" ';				\
-		echo ".global $${symbase}_end";				\
-		echo "$${symbase}_end:";				\
-	done < $<;							\
-	} > $@
-
-.builtin-dtbs.S: .builtin-dtbs-list FORCE
-	$(call if_changed,wrap_dtbs)
-
-quiet_cmd_gen_dtbs_list = GEN     $@
-      cmd_gen_dtbs_list = \
-	$(if $(CONFIG_BUILTIN_DTB_NAME), echo "arch/$(SRCARCH)/boot/dts/$(CONFIG_BUILTIN_DTB_NAME).dtb",:) > $@
-
-.builtin-dtbs-list: arch/$(SRCARCH)/boot/dts/dtbs-list FORCE
-	$(call if_changed,$(if $(CONFIG_BUILTIN_DTB_ALL),copy,gen_dtbs_list))
-
-targets += .builtin-dtbs-list
-
-ifdef CONFIG_GENERIC_BUILTIN_DTB
-targets += .builtin-dtbs.S .builtin-dtbs.o
-vmlinux.unstripped: .builtin-dtbs.o
-endif
-
-# vmlinux.unstripped
+# vmlinux
 # ---------------------------------------------------------------------------
 
-ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
-vmlinux.unstripped: arch/$(SRCARCH)/tools/vmlinux.arch.o
-
-arch/$(SRCARCH)/tools/vmlinux.arch.o: vmlinux.o FORCE
-	$(Q)$(MAKE) $(build)=arch/$(SRCARCH)/tools $@
-endif
-
-ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
-
-# Final link of vmlinux with optional arch pass after final link
-cmd_link_vmlinux =							\
-	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
-	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
+ifdef CONFIG_MODULE_HASHES
+targets += .tmp_module_hashes.o
+.tmp_module_hashes.o: .tmp_module_hashes.c FORCE
 
-targets += vmlinux.unstripped .vmlinux.export.o
-vmlinux.unstripped: scripts/link-vmlinux.sh vmlinux.o .vmlinux.export.o $(KBUILD_LDS) FORCE
-	+$(call if_changed_dep,link_vmlinux)
-ifdef CONFIG_DEBUG_INFO_BTF
-vmlinux.unstripped: $(RESOLVE_BTFIDS)
-endif
+quiet_cmd_module_hashes = OBJCOPY $@
+      cmd_module_hashes = $(OBJCOPY) --dump-section .module_hashes=$@ $<
 
-ifdef CONFIG_BUILDTIME_TABLE_SORT
-vmlinux.unstripped: scripts/sorttable
-endif
+targets += .tmp_module_hashes.bin
+.tmp_module_hashes.bin: .tmp_module_hashes.o FORCE
+	$(call if_changed,module_hashes)
 
-ifdef CONFIG_MODULE_HASHES
-vmlinux.unstripped: $(objtree)/scripts/modules-merkle-tree
-vmlinux.unstripped: modules.order
-vmlinux.unstripped: $(wildcard include/config/MODULE_INSTALL_STRIP)
+vmlinux: .tmp_module_hashes.bin
+patch-module-hashes := --update-section .module_hashes=.tmp_module_hashes.bin
 endif
 
-# vmlinux
-# ---------------------------------------------------------------------------
-
 remove-section-y                                   := .modinfo
 remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*' '!.rel*.dyn'
 # for compatibility with binutils < 2.32
@@ -98,70 +44,15 @@ remove-symbols := -w --strip-unneeded-symbol='__mod_device_table__*'
 # To avoid warnings: "empty loadable segment detected at ..." from GNU objcopy,
 # it is necessary to remove the PT_LOAD flag from the segment.
 quiet_cmd_strip_relocs = OBJCOPY $@
-      cmd_strip_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $@; \
-                         $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) $(remove-symbols) $@
+      cmd_script_relocs = $(OBJCOPY) $(patsubst %,--set-section-flags %=noload,$(remove-section-y)) $< $@; \
+                          $(OBJCOPY) $(addprefix --remove-section=,$(remove-section-y)) \
+                                     $(remove-symbols) \
+                                     $(patch-module-hashes) $@
 
 targets += vmlinux
 vmlinux: vmlinux.unstripped FORCE
 	$(call if_changed,strip_relocs)
 
-# modules.builtin.modinfo
-# ---------------------------------------------------------------------------
-
-# .modinfo in vmlinux.unstripped is aligned to 8 bytes for compatibility with
-# tools that expect vmlinux to have sufficiently aligned sections but the
-# additional bytes used for padding .modinfo to satisfy this requirement break
-# certain versions of kmod with
-#
-#   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
-#
-# Strip the trailing padding bytes after extracting .modinfo to comply with
-# what kmod expects to parse.
-quiet_cmd_modules_builtin_modinfo = GEN     $@
-      cmd_modules_builtin_modinfo = $(cmd_objcopy); \
-                                    sed -i 's/\x00\+$$/\x00/g' $@
-
-OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
-
-targets += modules.builtin.modinfo
-modules.builtin.modinfo: vmlinux.unstripped FORCE
-	$(call if_changed,modules_builtin_modinfo)
-
-# modules.builtin
-# ---------------------------------------------------------------------------
-
-__default: modules.builtin
-
-# The second line aids cases where multiple modules share the same object.
-
-quiet_cmd_modules_builtin = GEN     $@
-      cmd_modules_builtin = \
-	tr '\0' '\n' < $< | \
-	sed -n 's/^[[:alnum:]:_]*\.file=//p' | \
-	tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
-
-targets += modules.builtin
-modules.builtin: modules.builtin.modinfo FORCE
-	$(call if_changed,modules_builtin)
-
-# modules.builtin.ranges
-# ---------------------------------------------------------------------------
-ifdef CONFIG_BUILTIN_MODULE_RANGES
-__default: modules.builtin.ranges
-
-quiet_cmd_modules_builtin_ranges = GEN     $@
-      cmd_modules_builtin_ranges = gawk -f $(real-prereqs) > $@
-
-targets += modules.builtin.ranges
-modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
-			modules.builtin vmlinux.map vmlinux.o.map FORCE
-	$(call if_changed,modules_builtin_ranges)
-
-vmlinux.map: vmlinux.unstripped
-	@:
-
-endif
-
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.vmlinux_unstripped b/scripts/Makefile.vmlinux_unstripped
new file mode 100644
index 000000000000..914ee6f3b935
--- /dev/null
+++ b/scripts/Makefile.vmlinux_unstripped
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+PHONY := __default
+__default: vmlinux.unstripped
+
+include include/config/auto.conf
+include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
+
+targets :=
+
+%.o: %.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+%.o: %.S FORCE
+	$(call if_changed_rule,as_o_S)
+
+# Built-in dtb
+# ---------------------------------------------------------------------------
+
+quiet_cmd_wrap_dtbs = WRAP    $@
+      cmd_wrap_dtbs = {							\
+	echo '\#include <asm-generic/vmlinux.lds.h>';			\
+	echo '.section .dtb.init.rodata,"a"';				\
+	while read dtb; do						\
+		symbase=__dtb_$$(basename -s .dtb "$${dtb}" | tr - _);	\
+		echo '.balign STRUCT_ALIGNMENT';			\
+		echo ".global $${symbase}_begin";			\
+		echo "$${symbase}_begin:";				\
+		echo '.incbin "'$$dtb'" ';				\
+		echo ".global $${symbase}_end";				\
+		echo "$${symbase}_end:";				\
+	done < $<;							\
+	} > $@
+
+.builtin-dtbs.S: .builtin-dtbs-list FORCE
+	$(call if_changed,wrap_dtbs)
+
+quiet_cmd_gen_dtbs_list = GEN     $@
+      cmd_gen_dtbs_list = \
+	$(if $(CONFIG_BUILTIN_DTB_NAME), echo "arch/$(SRCARCH)/boot/dts/$(CONFIG_BUILTIN_DTB_NAME).dtb",:) > $@
+
+.builtin-dtbs-list: arch/$(SRCARCH)/boot/dts/dtbs-list FORCE
+	$(call if_changed,$(if $(CONFIG_BUILTIN_DTB_ALL),copy,gen_dtbs_list))
+
+targets += .builtin-dtbs-list
+
+ifdef CONFIG_GENERIC_BUILTIN_DTB
+targets += .builtin-dtbs.S .builtin-dtbs.o
+vmlinux.unstripped: .builtin-dtbs.o
+endif
+
+# vmlinux.unstripped
+# ---------------------------------------------------------------------------
+
+ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
+vmlinux.unstripped: arch/$(SRCARCH)/tools/vmlinux.arch.o
+
+arch/$(SRCARCH)/tools/vmlinux.arch.o: vmlinux.o FORCE
+	$(Q)$(MAKE) $(build)=arch/$(SRCARCH)/tools $@
+endif
+
+ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
+
+# Final link of vmlinux with optional arch pass after final link
+cmd_link_vmlinux =							\
+	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
+	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
+
+targets += vmlinux.unstripped .vmlinux.export.o
+vmlinux.unstripped: scripts/link-vmlinux.sh vmlinux.o .vmlinux.export.o $(KBUILD_LDS) FORCE
+	+$(call if_changed_dep,link_vmlinux)
+ifdef CONFIG_DEBUG_INFO_BTF
+vmlinux.unstripped: $(RESOLVE_BTFIDS)
+endif
+
+ifdef CONFIG_BUILDTIME_TABLE_SORT
+vmlinux.unstripped: scripts/sorttable
+endif
+
+ifdef CONFIG_MODULE_HASHES
+vmlinux.unstripped: $(objtree)/scripts/modules-merkle-tree
+vmlinux.unstripped: modules.order
+vmlinux.unstripped: $(wildcard include/config/MODULE_INSTALL_STRIP)
+endif
+
+# modules.builtin.modinfo
+# ---------------------------------------------------------------------------
+
+# .modinfo in vmlinux.unstripped is aligned to 8 bytes for compatibility with
+# tools that expect vmlinux to have sufficiently aligned sections but the
+# additional bytes used for padding .modinfo to satisfy this requirement break
+# certain versions of kmod with
+#
+#   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
+#
+# Strip the trailing padding bytes after extracting .modinfo to comply with
+# what kmod expects to parse.
+quiet_cmd_modules_builtin_modinfo = GEN     $@
+      cmd_modules_builtin_modinfo = $(cmd_objcopy); \
+                                    sed -i 's/\x00\+$$/\x00/g' $@
+
+OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
+
+targets += modules.builtin.modinfo
+modules.builtin.modinfo: vmlinux.unstripped FORCE
+	$(call if_changed,modules_builtin_modinfo)
+
+# modules.builtin
+# ---------------------------------------------------------------------------
+
+__default: modules.builtin
+
+# The second line aids cases where multiple modules share the same object.
+
+quiet_cmd_modules_builtin = GEN     $@
+      cmd_modules_builtin = \
+	tr '\0' '\n' < $< | \
+	sed -n 's/^[[:alnum:]:_]*\.file=//p' | \
+	tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
+
+targets += modules.builtin
+modules.builtin: modules.builtin.modinfo FORCE
+	$(call if_changed,modules_builtin)
+
+# modules.builtin.ranges
+# ---------------------------------------------------------------------------
+ifdef CONFIG_BUILTIN_MODULE_RANGES
+__default: modules.builtin.ranges
+
+quiet_cmd_modules_builtin_ranges = GEN     $@
+      cmd_modules_builtin_ranges = gawk -f $(real-prereqs) > $@
+
+targets += modules.builtin.ranges
+modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
+			modules.builtin vmlinux.map vmlinux.o.map FORCE
+	$(call if_changed,modules_builtin_ranges)
+
+vmlinux.map: vmlinux.unstripped
+	@:
+
+endif
+
+# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
+# ---------------------------------------------------------------------------
+
+PHONY += FORCE
+FORCE:
+
+# Read all saved command lines and dependencies for the $(targets) we
+# may be building above, using $(if_changed{,_dep}). As an
+# optimization, we don't need to read them if the target does not
+# exist, we will rebuild anyway in that case.
+
+existing-targets := $(wildcard $(sort $(targets)))
+
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+
+.PHONY: $(PHONY)
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index bfeff1f5753d..80cb09707426 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -316,17 +316,6 @@ if is_enabled CONFIG_BUILDTIME_TABLE_SORT; then
 	fi
 fi
 
-if is_enabled CONFIG_MODULE_HASHES; then
-	info MAKE modules
-	${MAKE} -f Makefile MODULE_HASHES_MODPOST_FINAL=1 modules
-	module_hashes_o=.tmp_module_hashes.o
-	info CC ${module_hashes_o}
-	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} ${KBUILD_CFLAGS} \
-		${KBUILD_CFLAGS_KERNEL} -fno-lto -c -o "${module_hashes_o}" ".tmp_module_hashes.c"
-	${OBJCOPY} --dump-section .module_hashes=.tmp_module_hashes.bin ${module_hashes_o}
-	${OBJCOPY} --update-section .module_hashes=.tmp_module_hashes.bin ${VMLINUX}
-fi
-
 # step a (see comment above)
 if is_enabled CONFIG_KALLSYMS; then
 	if ! cmp -s System.map "${kallsyms_sysmap}"; then

