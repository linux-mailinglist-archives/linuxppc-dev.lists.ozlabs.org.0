Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54240577229
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 01:09:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlkT91gvQz3c6B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 09:09:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u23P2EU6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u23P2EU6;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LlSYF6QgNz3bdM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 22:42:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 49E6DB80022;
	Sat, 16 Jul 2022 12:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6CBCC34114;
	Sat, 16 Jul 2022 12:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657975340;
	bh=HjF+NeyLSXs/BPREprBA9T9P63b0wfvdyRWiqF26LnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u23P2EU6qRL1vu6U1ohiYHNRckhBNC8KYLKdsiszyMvWP2H18PzeER3z0ZoCqs8Oz
	 jcDv58i75lMPxVsyThQIDpuusbS1ggqazOvkBjc0XIBMWOOCt6FhnBOHk0SQrwKruJ
	 XSo7j0jgJemcDPs9KTaC7peucwxSOMt4rJMAHkA5uwdtU7P3TVe7D9jWyfRcSJNhkk
	 ZBSZAiI0ucFmL1fK5Dskz6B94ZFS2WZrK5KXL25yE+Q8WIfgxDRTt01tLNXdu4Q7N8
	 DZobomePyEVsHwva8L8DkFKlH7VjnXfoKcEaNJxI9vUeO+aItFS6E/0zfWyfDmlOhH
	 6F5kuracHfOdw==
From: Conor Dooley <conor@kernel.org>
To: ojeda@kernel.org
Subject: Re: [PATCH v7 00/25] Rust support
Date: Sat, 16 Jul 2022 13:42:14 +0100
Message-Id: <20220716124214.329949-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220523020209.11810-1-ojeda@kernel.org>
References: <20220523020209.11810-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 17 Jul 2022 09:09:19 +1000
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
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-gpio@vger.kernel.org, jarkko@kernel.org, linux-kselftest@vger.kernel.org, torvalds@linux-foundation.org, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hey,

Maybe I am just missing something blatantly obvious here, but trying
to build rust support in -next fails for me. I am using ClangBuiltLinux
clang version 15.0.0 5b0788fef86ed7008a11f6ee19b9d86d42b6fcfa and LLD
15.0.0. Is it just expected that building -next with rust support is
not a good idea?
My defconfig is the default RISC-V one plus:
CONFIG_RUST=y
CONFIG_SAMPLES=y
CONFIG_SAMPLES_RUST=y
CONFIG_SAMPLE_RUST_MINIMAL=y

Thanks,
Conor.

Fail log:
  UPD     rust/target.json
  BINDGEN rust/bindings_generated.rs
  BINDGEN rust/bindings_helpers_generated.rs
  RUSTC L rust/core.o
  EXPORTS rust/exports_core_generated.h
  RUSTC P rust/libmacros.so
  RUSTC L rust/compiler_builtins.o
  RUSTC L rust/alloc.o
  RUSTC L rust/build_error.o
  EXPORTS rust/exports_alloc_generated.h
  RUSTC L rust/kernel.o
error[E0428]: the name `maple_enode` is defined multiple times
     --> linux/rust/bindings_generated.rs:18009:1
      |
18006 | pub struct maple_enode {
      | ---------------------- previous definition of the type `maple_enode` here
...
18009 | pub type maple_enode = *mut maple_enode;
      | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `maple_enode` redefined here
      |
      = note: `maple_enode` must be defined only once in the type namespace of this module

error[E0428]: the name `maple_pnode` is defined multiple times
     --> linux/rust/bindings_generated.rs:18015:1
      |
18012 | pub struct maple_pnode {
      | ---------------------- previous definition of the type `maple_pnode` here
...
18015 | pub type maple_pnode = *mut maple_pnode;
      | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `maple_pnode` redefined here
      |
      = note: `maple_pnode` must be defined only once in the type namespace of this module

error[E0391]: cycle detected when expanding type alias `bindings::bindings_raw::maple_pnode`
     --> linux/rust/bindings_generated.rs:18015:29
      |
18015 | pub type maple_pnode = *mut maple_pnode;
      |                             ^^^^^^^^^^^
      |
      = note: ...which immediately requires expanding type alias `bindings::bindings_raw::maple_pnode` again
      = note: type aliases cannot be recursive
      = help: consider using a struct, enum, or union instead to break the cycle
      = help: see <https://doc.rust-lang.org/reference/types.html#recursive-types> for more information
note: cycle used when computing type of `bindings::bindings_raw::maple_range_64::parent`
     --> linux/rust/bindings_generated.rs:18058:22
      |
18058 |     pub parent: *mut maple_pnode,
      |                      ^^^^^^^^^^^

error[E0391]: cycle detected when expanding type alias `bindings::bindings_raw::maple_enode`
     --> linux/rust/bindings_generated.rs:18009:29
      |
18009 | pub type maple_enode = *mut maple_enode;
      |                             ^^^^^^^^^^^
      |
      = note: ...which immediately requires expanding type alias `bindings::bindings_raw::maple_enode` again
      = note: type aliases cannot be recursive
      = help: consider using a struct, enum, or union instead to break the cycle
      = help: see <https://doc.rust-lang.org/reference/types.html#recursive-types> for more information
note: cycle used when computing type of `bindings::bindings_raw::maple_topiary::next`
     --> linux/rust/bindings_generated.rs:18340:20
      |
18340 |     pub next: *mut maple_enode,
      |                    ^^^^^^^^^^^

error[E0117]: only traits defined in the current crate can be implemented for arbitrary types
     --> linux/rust/bindings_generated.rs:18005:10
      |
18005 | #[derive(Copy, Clone)]
      |          ^^^^
      |          |
      |          impl doesn't use only types from inside the current crate
      |          `*mut [type error]` is not defined in the current crate
      |
      = note: define and implement a trait or new type instead
      = note: this error originates in the derive macro `Copy` (in Nightly builds, run with -Z macro-backtrace for more info)

error[E0117]: only traits defined in the current crate can be implemented for arbitrary types
     --> linux/rust/bindings_generated.rs:18011:10
      |
18011 | #[derive(Copy, Clone)]
      |          ^^^^
      |          |
      |          impl doesn't use only types from inside the current crate
      |          `*mut [type error]` is not defined in the current crate
      |
      = note: define and implement a trait or new type instead
      = note: this error originates in the derive macro `Copy` (in Nightly builds, run with -Z macro-backtrace for more info)

error[E0117]: only traits defined in the current crate can be implemented for arbitrary types
     --> linux/rust/bindings_generated.rs:18005:16
      |
18005 | #[derive(Copy, Clone)]
      |                ^^^^^
      |                |
      |                impl doesn't use only types from inside the current crate
      |                `*mut [type error]` is not defined in the current crate
      |
      = note: define and implement a trait or new type instead
      = note: this error originates in the derive macro `Clone` (in Nightly builds, run with -Z macro-backtrace for more info)

error[E0117]: only traits defined in the current crate can be implemented for arbitrary types
     --> linux/rust/bindings_generated.rs:18011:16
      |
18011 | #[derive(Copy, Clone)]
      |                ^^^^^
      |                |
      |                impl doesn't use only types from inside the current crate
      |                `*mut [type error]` is not defined in the current crate
      |
      = note: define and implement a trait or new type instead
      = note: this error originates in the derive macro `Clone` (in Nightly builds, run with -Z macro-backtrace for more info)

error: aborting due to 8 previous errors
