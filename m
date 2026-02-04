Return-Path: <linuxppc-dev+bounces-16567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEbyK4PFgmkTawMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 05:05:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C86CE1743
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 05:05:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5Rb162ZCz30Pr;
	Wed, 04 Feb 2026 15:05:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=82.65.109.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770177917;
	cv=none; b=GUfFnVyzpiFMG4HKViVKg+wmR7OHlGOrPKkkPZbReDYlcr2uemeGgHPtZG1eaQnJxtCdzUGXdA7zZ3OP+vtK6gVoP9pCupcH0/PalPUPipTtFnXdlaEn+Lwi18Oc1aPMzvGw+GFt++q6FlOwgLXgGJxVx4cju4q8LQliEkkGIvAkQXt4In6fcTraulHTCAx0UIKJGLEJfu3y2eNkp2xud+9E3Eoyfhw441A4jHC2pvp6fRRNlpYDbK18Rj0eXk5aL0diCWl4QomKBy51oCd58TeTLekL+k1lqdwUNXy6cJBS8Jez3jCXhYSKKFztq6JuSixlGAubLek5R9qcI/0x5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770177917; c=relaxed/relaxed;
	bh=C2pgyRomcbyuBPMzvrCeMxccnLLUJQy9By6fN8Jwu+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HrDxJ55uAGzGj/Q9sxMDtoDyCScq2qq1jzKeOn/13KZ+cgJoHkNuAqSzbhWAiezGB1nt37OHyg8ozyXJ/bi4I8NUO00piM2q4Voqf/b6/y0m//eiLcEKxxAwOLodA+5wqzifvGA3vz54GnVrzKXp5mseILLNbWlkzY8O5es2bG8tebLp4xbnUmhJCMyGEK3E0YPJ7ObgrGBDSImJNEhL7UeNvIYI9nOpkLLghC1E6vUOyrYxq0a79aDL2GFsJSI0cj8ZU2pNIu3MC4CCmZmGHyVQRE0TsV9hjg1UdBpR+Wo+a4r9RX6vasdmfnoDN0PNtQFfeOFFgkVacrHC/uXonQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org) smtp.mailfrom=linkmauve.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org)
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5RZz48Zbz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 15:05:15 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 85448F43B32; Wed, 04 Feb 2026 05:05:07 +0100 (CET)
From: Link Mauve <linkmauve@linkmauve.fr>
To: rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	officialTechflashYT@gmail.com,
	Ash Logan <ash@heyquark.com>,
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v2 0/4] Add Rust abstractions for nvmem-provider
Date: Wed,  4 Feb 2026 05:04:57 +0100
Message-ID: <20260204040505.8447-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.53.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linkmauve.fr];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16567-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:rust-for-linux@vger.kernel.org,m:linkmauve@linkmauve.fr,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srini@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:ardb@kernel.org,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:gregkh@linuxfoundation.org,m:lyude@redhat.com,m:lina+kernel@asahilina.net,m:viresh.kumar@linaro.org,m:lorenzo.stoakes@oracle.com,m:tamird@kernel.org,m:fujita.tomonori@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:officialTechflashYT@gmail.com,m:ash@heyquark.com,m:rw-r-r-0644@protonmail.com,m:j.neuschaefer@gmx.net,m:lina@asahilina.net,m:fujitatomonori@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linkmauve.fr,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,oracle.com,linuxfoundation.org,redhat.com,asahilina.net,linaro.org,lists.ozlabs.org,vger.kernel.org,heyquark.com,gmx.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 1C86CE1743
X-Rspamd-Action: no action

Hi, this is my first foray in Rust in the kernel!  I’m fairly used to
both Rust and the kernel, but not yet to both at the same time.

I wanted to try something simple before jumping to more advanced stuff
like DRM or V4L2 drivers, so I set on rewriting one of my old Wii
drivers in Rust.

I made sure there was no unsafe anywhere in the driver, and tried to
keep it to as few places as possible in the nvmem abstraction.

I’ve tested it on a Wii, using a downstream branch[1], plus the PowerPC
support patch[2], plus a terrible patch to make libcore not use integer
division on u64 or u128[3].  I’ve tested that the data I get out of this
driver result to the same data as the previous C driver.

Thanks for your time!

[1] https://github.com/Wii-Linux/wii-linux-ngx/commits/wii-mainline
[2] https://lore.kernel.org/rust-for-linux/20260204030507.8203-1-linkmauve@linkmauve.fr/T/
[3] https://linkmauve.fr/files/0001-XXX-Unimplement-core-fmt-on-u64-u128-and-Duration.patch

Changes since v1:
- Add Rust helpers to read and write as big endian.
- Set CONFIG_RUST=y in the Wii defconfig.
- Drop the patch to document nvmem-provider.h, this can go in a latter
  series.

In the nvmem abstractions:
- Replace as pointer casts with .cast(), .cast_const() and .cast_mut().
- Replace NvmemConfig::set_*() with NvmemConfig::with_*() to allow the
  builder pattern.
- Expose devm_nvmem_register() on Device instead of in NvmemConfig,
  making it both more correct and more evident coming from C.
- Make it set priv, reg_read and reg_write, as those are managed by the
  abstraction.

In the nintendo-otp driver:
- Add missing RUST depends
- Remove unnecessary reference to pdev in the driver.
- Simplify the loop using while let instead of break.
- Remove unnecessary Drop impl.
- Adapt to the NvmemConfig changes.
- Use c"" instead of c_str!().
- Correctly read and write as big endian.
- Keep a pinned reference to the iomem, otherwise the driver will crash
  trying to access unmapped memory.

Link Mauve (4):
  rust: io: Add big-endian read and write functions
  rust: nvmem: Add an abstraction for nvmem providers
  nvmem: Replace the Wii and Wii U OTP driver with a Rust one
  powerpc: wii_defconfig: Enable Rust

 arch/powerpc/configs/wii_defconfig |   1 +
 drivers/nvmem/Kconfig              |   1 +
 drivers/nvmem/Makefile             |   2 +-
 drivers/nvmem/nintendo-otp.c       | 122 ---------------------
 drivers/nvmem/nintendo_otp.rs      | 127 ++++++++++++++++++++++
 rust/bindings/bindings_helper.h    |   1 +
 rust/helpers/io.c                  |  34 ++++++
 rust/kernel/io.rs                  |  18 ++++
 rust/kernel/lib.rs                 |   2 +
 rust/kernel/nvmem.rs               | 163 +++++++++++++++++++++++++++++
 10 files changed, 348 insertions(+), 123 deletions(-)
 delete mode 100644 drivers/nvmem/nintendo-otp.c
 create mode 100644 drivers/nvmem/nintendo_otp.rs
 create mode 100644 rust/kernel/nvmem.rs

-- 
2.52.0


