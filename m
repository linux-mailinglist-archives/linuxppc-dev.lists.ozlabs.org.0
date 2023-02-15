Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A07DB697C1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:45:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGyV043H1z3cNg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:45:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRH4RjRz3cKW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:07 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRD1rvYz4x4r;
	Wed, 15 Feb 2023 23:43:04 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>, linux-integrity@vger.kernel.org
In-Reply-To: <20230210080401.345462-1-ajd@linux.ibm.com>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
Subject: Re: [PATCH v6 00/26] pSeries dynamic secure boot secvar interface + platform keyring loading
Message-Id: <167646488832.1421441.10975279847345153357.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:41:28 +1100
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
Cc: gjoyce@linux.ibm.com, nayna@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, ruscur@russell.cc, linux-kernel@vger.kernel.org, npiggin@gmail.com, sudhakar@linux.ibm.com, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, zohar@linux.ibm.com, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 Feb 2023 19:03:35 +1100, Andrew Donnellan wrote:
> This series exposes an interface to userspace for reading and writing
> secure variables contained within the PowerVM LPAR Platform KeyStore
> (PLPKS) for the purpose of configuring dynamic secure boot, and adds
> the glue required to load keys from the PLPKS into the platform keyring.
> 
> This series builds on past work by Nayna Jain[0] in exposing PLPKS
> variables to userspace.  Rather than being a generic interface for
> interacting with the keystore, however, we use the existing powerpc
> secvar infrastructure to only expose objects in the keystore used
> for dynamic secure boot.  This has the benefit of leveraging an
> existing interface and making the implementation relatively minimal.
> 
> [...]

Applied to powerpc/next.

[01/26] powerpc/pseries: Fix handling of PLPKS object flushing timeout
        https://git.kernel.org/powerpc/c/f74dcbfd27c647af9b7b83f3711c63712c677abd
[02/26] powerpc/pseries: Fix alignment of PLPKS structures and buffers
        https://git.kernel.org/powerpc/c/fcf63d6b8ab9b12c2ce1b4bde12a3c391029c998
[03/26] powerpc/secvar: Fix incorrect return in secvar_sysfs_load()
        https://git.kernel.org/powerpc/c/c9fd2952754a03b2c14433c0318f4b46e9c0f2ef
[04/26] powerpc/secvar: Use u64 in secvar_operations
        https://git.kernel.org/powerpc/c/53cea34b0a0a03568e189f8dfe2eb06f938986c8
[05/26] powerpc/secvar: Warn and error if multiple secvar ops are set
        https://git.kernel.org/powerpc/c/26149b02021158248b13e323f06372d87f076883
[06/26] powerpc/secvar: Use sysfs_emit() instead of sprintf()
        https://git.kernel.org/powerpc/c/16943a2faf94ef671e60c7577511c0d119fbdfc8
[07/26] powerpc/secvar: Handle format string in the consumer
        https://git.kernel.org/powerpc/c/ec2f40bd004b4b9142469282d4a6ce9afa22f9c0
[08/26] powerpc/secvar: Handle max object size in the consumer
        https://git.kernel.org/powerpc/c/e02407944052554c1685e11e56175147d1ac56b6
[09/26] powerpc/secvar: Clean up init error messages
        https://git.kernel.org/powerpc/c/caefd3b77450e330845755ea57add2315fd5e4d9
[10/26] powerpc/secvar: Extend sysfs to include config vars
        https://git.kernel.org/powerpc/c/86b6c0ae2caee9cadee1256d31b204ea54cb55c0
[11/26] powerpc/secvar: Allow backend to populate static list of variable names
        https://git.kernel.org/powerpc/c/50a466bf3e6f6f177dc0aeefa46a2f8927075a1d
[12/26] powerpc/secvar: Warn when PAGE_SIZE is smaller than max object size
        https://git.kernel.org/powerpc/c/6d64c497a31bd888110785def44529ebb96bce49
[13/26] powerpc/secvar: Don't print error on ENOENT when reading variables
        https://git.kernel.org/powerpc/c/c96db155ebc6be868d5dde1b5caf6879c181cda4
[14/26] powerpc/pseries: Move plpks.h to include directory
        https://git.kernel.org/powerpc/c/90b74e305d6b5a444b1283dd7ad1caf6acaa0340
[15/26] powerpc/pseries: Move PLPKS constants to header file
        https://git.kernel.org/powerpc/c/3def7a3e7c2ce2ab5e5c54561da7125206851be4
[16/26] powerpc/pseries: Expose PLPKS config values, support additional fields
        https://git.kernel.org/powerpc/c/119da30d037dced29118fb90afe683ff50313386
[17/26] powerpc/pseries: Implement signed update for PLPKS objects
        https://git.kernel.org/powerpc/c/899d9b8fee66da820eadc60b2a70090eb83db761
[18/26] powerpc/pseries: Log hcall return codes for PLPKS debug
        https://git.kernel.org/powerpc/c/ebdcd42347157647ffe6c4d2808e4e5c146475d3
[19/26] powerpc/pseries: Make caller pass buffer to plpks_read_var()
        https://git.kernel.org/powerpc/c/0cf2cc1fe4e2e7a37da077cdd3fba5cfd9a6a36c
[20/26] powerpc/pseries: Turn PSERIES_PLPKS into a hidden option
        https://git.kernel.org/powerpc/c/46b2cbebac1e862e4c8317aa26e7d7d632242c2f
[21/26] powerpc/pseries: Clarify warning when PLPKS password already set
        https://git.kernel.org/powerpc/c/ca4f1d221c84fe364517b15af65f3f0e4ce9719a
[22/26] powerpc/pseries: Add helper to get PLPKS password length
        https://git.kernel.org/powerpc/c/9ee76bd5c7e39b622660cc14833ead1967f2038d
[23/26] powerpc/pseries: Pass PLPKS password on kexec
        https://git.kernel.org/powerpc/c/91361b5175d2b3704f7e436d0071893c839e1199
[24/26] powerpc/pseries: Implement secvars for dynamic secure boot
        https://git.kernel.org/powerpc/c/ccadf154cb00b9ee9618d209aa3efc54b35a34b4
[25/26] integrity/powerpc: Improve error handling & reporting when loading certs
        https://git.kernel.org/powerpc/c/3c8069b0c3832674abd80a5cf019c913e62de9a5
[26/26] integrity/powerpc: Support loading keys from PLPKS
        https://git.kernel.org/powerpc/c/4b3e71e9a34c48f370b6281e9477515d588e7b26

cheers
