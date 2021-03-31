Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB24134F5FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:14:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97cw6RkPz3fB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:14:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XT0PcLz3c0F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:17 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XS0PjQz9sj5; Wed, 31 Mar 2021 12:10:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <cover.1615552866.git.christophe.leroy@csgroup.eu>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 00/41] powerpc/32: Switch to interrupt entry/exit in C
Message-Id: <161715297685.226945.5047489618748920066.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:36 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Mar 2021 12:50:09 +0000 (UTC), Christophe Leroy wrote:
> This series aims at porting interrupt entry/exit in C on PPC32, using
> the work already merged for PPC64.
> 
> First patch is an optimisation around unrecoverable_exception() function.
> 
> Six following patches do minimal changes in 40x in order to be able to enable MMU
> earlier in exception entry.
> 
> [...]

Applied to powerpc/next.

[01/41] powerpc/traps: Declare unrecoverable_exception() as __noreturn
        https://git.kernel.org/powerpc/c/a58cbed68315111c663f35603a42547f72acd6f8
[02/41] powerpc/40x: Don't use SPRN_SPRG_SCRATCH0/1 in TLB miss handlers
        https://git.kernel.org/powerpc/c/52ae92cc290f0506eef9ad5466bb453ce4a9e80e
[03/41] powerpc/40x: Change CRITICAL_EXCEPTION_PROLOG macro to a gas macro
        https://git.kernel.org/powerpc/c/9d3c18a11a930afe65d33527300a42e0872c744d
[04/41] powerpc/40x: Save SRR0/SRR1 and r10/r11 earlier in critical exception
        https://git.kernel.org/powerpc/c/fcd4b43c36c69aa41e79a511edbb06c7020a6061
[05/41] powerpc/40x: Reorder a few instructions in critical exception prolog
        https://git.kernel.org/powerpc/c/26c468860c32022ffe9caf16691764b77fb8eead
[06/41] powerpc/40x: Prepare for enabling MMU in critical exception prolog
        https://git.kernel.org/powerpc/c/0fc1e93481f67a49f67c9168b71842eeb0998b25
[07/41] powerpc/40x: Prepare normal exception handler for enabling MMU early
        https://git.kernel.org/powerpc/c/0512aadd750acf72b8906973c34e7092642d4323
[08/41] powerpc/32: Reconcile interrupts in C
        https://git.kernel.org/powerpc/c/be39e10506830a2e654fb799a48025999f89a6ff
[09/41] powerpc/32: Entry cpu time accounting in C
        https://git.kernel.org/powerpc/c/f93d866e14b746112fb29d69197dd83075bbd28c
[10/41] powerpc/32: Handle bookE debugging in C in exception entry
        https://git.kernel.org/powerpc/c/79f4bb17f18162dd95d6aeb6dc3b7da54d6139aa
[11/41] powerpc/32: Use fast instruction to set MSR RI in exception prolog on 8xx
        https://git.kernel.org/powerpc/c/e464d92b292cc61f8f0791cf87d3646204bbb208
[12/41] powerpc/32: Remove ksp_limit
        https://git.kernel.org/powerpc/c/5747230645562921b5bc19f6409f7af08fe17c6d
[13/41] powerpc/32: Always enable data translation in exception prolog
        https://git.kernel.org/powerpc/c/7aa8dd67f15731f659390018b5c9fd95f5975b3d
[14/41] powerpc/32: Tag DAR in EXCEPTION_PROLOG_2 for the 8xx
        https://git.kernel.org/powerpc/c/5b1c9a0d7f3bcac591767fa1aad1323564673b26
[15/41] powerpc/32: Enable instruction translation at the same time as data translation
        https://git.kernel.org/powerpc/c/9b6150fb8942d92e0991b9a4b02fa2e6f6b03238
[16/41] powerpc/32: Statically initialise first emergency context
        https://git.kernel.org/powerpc/c/a4719f5bb6d7dc220bffdc1b9f5ce5eaa5543581
[17/41] powerpc/32: Add vmap_stack_overflow label inside the macro
        https://git.kernel.org/powerpc/c/5b5e5bc53def654c2dc437dd327f7a47c48d81d3
[18/41] powerpc/32: Use START_EXCEPTION() as much as possible
        https://git.kernel.org/powerpc/c/7bf1d7e1abab0d9f47ebce144deadb4409d0d631
[19/41] powerpc/32: Move exception prolog code into .text once MMU is back on
        https://git.kernel.org/powerpc/c/dc13b889b586f499cc87eb2b0b7e901778b3b5cf
[20/41] powerpc/32: Provide a name to exception prolog continuation in virtual mode
        https://git.kernel.org/powerpc/c/8f844c06f460687b028c675c3fa68f8e735aeb8c
[21/41] powerpc/32: Refactor booke critical registers saving
        https://git.kernel.org/powerpc/c/32d2ca0e969a3620f71dff166a95ebf3f735b72e
[22/41] powerpc/32: Perform normal function call in exception entry
        https://git.kernel.org/powerpc/c/0f2793e33db2e2f062968f2ca789b6826972b05b
[23/41] powerpc/32: Always save non volatile registers on exception entry
        https://git.kernel.org/powerpc/c/e9f99704aafcdbd90ba20b81db2dae8526d8b8e5
[24/41] powerpc/32: Replace ASM exception exit by C exception exit from ppc64
        https://git.kernel.org/powerpc/c/b96bae3ae2cb6337c0a1ad160f4cbb0666e5e38b
[25/41] powerpc/32: Don't save thread.regs on interrupt entry
        https://git.kernel.org/powerpc/c/db297c3b07af7856fb7c666fbc9792d8e37556be
[26/41] powerpc/32: Set regs parameter in r3 in transfer_to_handler
        https://git.kernel.org/powerpc/c/e72915560b15f58c2ffe08144d9a7163daa18db4
[27/41] powerpc/32: Call bad_page_fault() from do_page_fault()
        https://git.kernel.org/powerpc/c/af6f2ce84b2f666762f75f085a7e5d6514743a84
[28/41] powerpc/32: Save trap number on stack in exception prolog
        https://git.kernel.org/powerpc/c/719e7e212c7e637a795f130dbdd5db6c291e463f
[29/41] powerpc/32: Add a prepare_transfer_to_handler macro for exception prologs
        https://git.kernel.org/powerpc/c/bce4c26a4e324cb096a3768cdc3aad4e2552c3d0
[30/41] powerpc/32: Only restore non volatile registers when required
        https://git.kernel.org/powerpc/c/8f6ff5bd9b73a7912356f378adfb85e9a4e7ce65
[31/41] powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
        https://git.kernel.org/powerpc/c/4c0104a83fc3990a76a01a2f4e504251fa9814c4
[32/41] powerpc/32: Remove the xfer parameter in EXCEPTION() macro
        https://git.kernel.org/powerpc/c/acc142b6230eb2d9cec9b9e3baac1bc074df8ba3
[33/41] powerpc/32: Refactor saving of volatile registers in exception prologs
        https://git.kernel.org/powerpc/c/a305597850c96e2f2d349533cf3b514fa4b7b9f8
[34/41] powerpc/32: Save remaining registers in exception prolog
        https://git.kernel.org/powerpc/c/16db54369df614bf386aa31a6730c5bdb1bf4ffd
[35/41] powerpc/32: Return directly from power_save_ppc32_restore()
        https://git.kernel.org/powerpc/c/a5d33be0512b4565808a3aed05567cb56c0e6ad0
[36/41] powerpc/32: Only use prepare_transfer_to_handler function on book3s/32 and e500
        https://git.kernel.org/powerpc/c/a2b3e09ae41c71d27d9b8da9baf31e0d9a97b864
[37/41] powerpc/32s: Move KUEP locking/unlocking in C
        https://git.kernel.org/powerpc/c/b5efec00b671c5d7e9cb9e73a1d4925dd6ce8dcd
[38/41] powerpc/64s: Make kuap_check_amr() and kuap_get_and_check_amr() generic
        https://git.kernel.org/powerpc/c/ad2d2344771dabc5f0f14d85d5e7d2ddc613f385
[39/41] powerpc/32s: Create C version of kuap save/restore/check helpers
        https://git.kernel.org/powerpc/c/21eb58ae4fce559d4e025df042db2bc0bb100f93
[40/41] powerpc/8xx: Create C version of kuap save/restore/check helpers
        https://git.kernel.org/powerpc/c/0b45359aa2df7b761817a9664cfb53ea3070c390
[41/41] powerpc/32: Manage KUAP in C
        https://git.kernel.org/powerpc/c/c16728835eec45fa82f4744a52940717ac828f6d

cheers
