Return-Path: <linuxppc-dev+bounces-16569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JKLBGZDFgmkoawMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 05:05:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA98E1760
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 05:05:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5Rb54MFJz3btg;
	Wed, 04 Feb 2026 15:05:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=82.65.109.163
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770177921;
	cv=none; b=nK2fUaRMSzprko4szGVroPR/2Z87mUUR1Ndr/qNTXIAzBy9oG/A4nCyYLdgKELSCfNFp6PlFdVZkCpqrSDdnf6uGrpkGR2AV1bjJBFwPoF+wfSdzKHGSg7U/z08hqGFSi/C857m4E/NYPLZkN2pGNhHxjQ8Ez3Jq/sN3ys/qqbOGtRmYw+a8maXtmBqmkesmOhonGXRkdiMqSASUyumcwMdE9jh7Z5gp98kOjd1exTPFeVWpxGPKZ4sLkXjNRAFOVqaEaSQaKluFfVaK0WC2wHEd0gh5/OfkGLJlFE4e6etpvQ9WeGoVviWE9U+79eg1Npi27eIN+8y1H8HCBk1Myg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770177921; c=relaxed/relaxed;
	bh=0KVoPCoIjCtZdUEWgoo39JZwgRhHM/ZXuVdR0KsWjEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TSZDrfCLEoL48XwM1foFjt2rqqSHFp2GoERh2U7o737nE3ssOKbSVTZMf765b1dN2bAKG9e2kt7gAH4gi3Wx8rktk60hUU4R7FKbJt8Kzw0lc5fc3MWz43P2c0Vh5Ges85I1s5GXnuRT41jMTkcWBAFBikTykBbo0+lSGWSsNnWAgoyCGgrKHya8G1xIgHxCp0kYn1qgi0r8kk0glS6msPrVOW9J5vNU39trFuJ6Mhxq4O13mCekcayn5vfOZg3Q35TnqQsS2wkDH8KhOjFPBcbGkfbUwxLKAX7vwCGxVUbCSjhPHCdUuw/Wk0jgUuhW4ChcAzsGQjbZC6/EuTd1MQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org) smtp.mailfrom=linkmauve.fr
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr; envelope-from=linkmauve@linkmauve.fr; receiver=lists.ozlabs.org)
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5Rb35wbGz3bsC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 15:05:19 +1100 (AEDT)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id D26EAF43B4A; Wed, 04 Feb 2026 05:05:08 +0100 (CET)
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
Subject: [PATCH v2 2/4] rust: nvmem: Add an abstraction for nvmem providers
Date: Wed,  4 Feb 2026 05:04:59 +0100
Message-ID: <20260204040505.8447-3-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204040505.8447-1-linkmauve@linkmauve.fr>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linkmauve.fr];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[linkmauve@linkmauve.fr,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16569-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 7BA98E1760
X-Rspamd-Action: no action

This is my very first Rust abstraction in the kernel, I took inspiration
from various other abstractions that had already been written.

I only implemented enough to rewrite a very simple driver I wrote in the
past, in order to test the API and make sure it’s at least as ergonomic
as the C version, without any unsafe at all.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/nvmem.rs            | 163 ++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 rust/kernel/nvmem.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b42..522a76b2e294 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -65,6 +65,7 @@
 #include <linux/mdio.h>
 #include <linux/mm.h>
 #include <linux/miscdevice.h>
+#include <linux/nvmem-provider.h>
 #include <linux/of_device.h>
 #include <linux/pci.h>
 #include <linux/phy.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 696f62f85eb5..97f3fc1e8e12 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -118,6 +118,8 @@
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod num;
+#[cfg(CONFIG_NVMEM)]
+pub mod nvmem;
 pub mod of;
 #[cfg(CONFIG_PM_OPP)]
 pub mod opp;
diff --git a/rust/kernel/nvmem.rs b/rust/kernel/nvmem.rs
new file mode 100644
index 000000000000..4b81fd65c9a7
--- /dev/null
+++ b/rust/kernel/nvmem.rs
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! nvmem framework provider.
+//!
+//! Copyright (C) 2026 Link Mauve <linkmauve@linkmauve.fr>
+
+use crate::build_error;
+use crate::device::Device;
+use crate::error::{from_result, VTABLE_DEFAULT_ERROR};
+use crate::prelude::*;
+use core::marker::PhantomData;
+use macros::vtable;
+
+/// The possible types for a nvmem provider.
+#[derive(Default)]
+#[repr(u32)]
+pub enum Type {
+    /// The type of memory is unknown.
+    #[default]
+    Unknown = bindings::nvmem_type_NVMEM_TYPE_UNKNOWN,
+
+    /// Electrically erasable programmable ROM.
+    Eeprom = bindings::nvmem_type_NVMEM_TYPE_EEPROM,
+
+    /// One-time programmable memory.
+    Otp = bindings::nvmem_type_NVMEM_TYPE_OTP,
+
+    /// This memory is backed by a battery.
+    BatteryBacked = bindings::nvmem_type_NVMEM_TYPE_BATTERY_BACKED,
+
+    /// Ferroelectric RAM.
+    Fram = bindings::nvmem_type_NVMEM_TYPE_FRAM,
+}
+
+/// nvmem configuration.
+///
+/// Rust abstraction for the C `struct nvmem_config`.
+#[derive(Default)]
+#[repr(transparent)]
+pub struct NvmemConfig<T: NvmemProvider + Default> {
+    inner: bindings::nvmem_config,
+    _p: PhantomData<T>,
+}
+
+impl<T: NvmemProvider + Default> NvmemConfig<T> {
+    /// NvmemConfig's read callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
+    extern "C" fn reg_read(
+        context: *mut c_void,
+        offset: u32,
+        val: *mut c_void,
+        bytes: usize,
+    ) -> i32 {
+        from_result(|| {
+            let context = context.cast::<T::Priv>();
+            // SAFETY: context is a valid T::Priv as set in Device::nvmem_register().
+            let context = unsafe { &*context };
+            let val = val.cast::<u8>();
+            // SAFETY: val should be non-null, and allocated for bytes bytes.
+            let data = unsafe { core::slice::from_raw_parts_mut(val, bytes) };
+            T::read(context, offset, data).map(|()| 0)
+        })
+    }
+
+    /// NvmemConfig's write callback.
+    ///
+    /// SAFETY: Called from C. Inputs must be valid pointers.
+    extern "C" fn reg_write(
+        context: *mut c_void,
+        offset: u32,
+        // TODO: Change val from void* to const void* in the C API!
+        val: *mut c_void,
+        bytes: usize,
+    ) -> i32 {
+        from_result(|| {
+            let context = context.cast::<T::Priv>();
+            // SAFETY: context is a valid T::Priv as set in Device::nvmem_register().
+            let context = unsafe { &*context };
+            let val = val.cast::<u8>().cast_const();
+            // SAFETY: val should be non-null, and allocated for bytes bytes.
+            let data = unsafe { core::slice::from_raw_parts(val, bytes) };
+            T::write(context, offset, data).map(|()| 0)
+        })
+    }
+
+    /// Optional name.
+    pub fn with_name(mut self, name: &CStr) -> Self {
+        self.inner.name = name.as_char_ptr();
+        self
+    }
+
+    /// Type of the nvmem storage
+    pub fn with_type(mut self, type_: Type) -> Self {
+        self.inner.type_ = type_ as u32;
+        self
+    }
+
+    /// Device is read-only.
+    pub fn with_read_only(mut self, read_only: bool) -> Self {
+        self.inner.read_only = read_only;
+        self
+    }
+
+    /// Device is accessibly to root only.
+    pub fn with_root_only(mut self, root_only: bool) -> Self {
+        self.inner.root_only = root_only;
+        self
+    }
+
+    /// Device size.
+    pub fn with_size(mut self, size: i32) -> Self {
+        self.inner.size = size;
+        self
+    }
+
+    /// Minimum read/write access granularity.
+    pub fn with_word_size(mut self, word_size: i32) -> Self {
+        self.inner.word_size = word_size;
+        self
+    }
+
+    /// Minimum read/write access stride.
+    pub fn with_stride(mut self, stride: i32) -> Self {
+        self.inner.stride = stride;
+        self
+    }
+}
+
+impl Device {
+    /// Register a managed nvmem provider on the given device.
+    pub fn nvmem_register<T>(&self, mut config: NvmemConfig<T>, priv_: &T::Priv)
+    where
+        T: NvmemProvider + Default,
+    {
+        // FIXME: The last cast to mut indicates some unsoundness here.
+        config.inner.priv_ = core::ptr::from_ref(priv_).cast::<c_void>().cast_mut();
+        config.inner.dev = self.as_raw();
+        config.inner.reg_read = Some(NvmemConfig::<T>::reg_read);
+        config.inner.reg_write = Some(NvmemConfig::<T>::reg_write);
+        // SAFETY: Both self and config can’t be null here, and should have the correct type.
+        unsafe { bindings::devm_nvmem_register(self.as_raw(), &config.inner) };
+    }
+}
+
+/// Helper trait to define the callbacks of a nvmem provider.
+#[vtable]
+pub trait NvmemProvider {
+    /// The type passed into the context for read and write functions.
+    type Priv;
+
+    /// Callback to read data.
+    #[inline]
+    fn read(_context: &Self::Priv, _offset: u32, _data: &mut [u8]) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Callback to write data.
+    #[inline]
+    fn write(_context: &Self::Priv, _offset: u32, _data: &[u8]) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+}
-- 
2.52.0


