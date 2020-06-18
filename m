Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AA21FEC0A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 09:14:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nY8j11ZPzDrF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 17:14:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=prsriva@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=aG83qxYX; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 49nY4v4f8qzDrBl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 17:11:11 +1000 (AEST)
Received: from prsriva-linux.hsd1.wa.comcast.net
 (c-24-19-135-168.hsd1.wa.comcast.net [24.19.135.168])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8918F20B4781;
 Thu, 18 Jun 2020 00:11:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8918F20B4781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1592464269;
 bh=lDSc0jJUTA/sW6q8KjNuhbmPa1VR7NZJ8pXu5G8PT78=;
 h=From:To:Cc:Subject:Date:From;
 b=aG83qxYXRNhqUmLDNYpbm33MDP2wZSL6QKrD2jzlLiNColOuwrb8FqAsVDhwxeIUj
 F6PyyYZeZsLvmO03Jk+E0IfjD1E+TJlD0wQIkfoT4XYzNzULxLkKcEFezwju6U+yNW
 CQB9TkUkQuhmLmJNPl9ot4OJOFtVYYPbjejsJWrw=
From: Prakhar Srivastava <prsriva@linux.microsoft.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [V2 PATCH 0/3] Adding support for carrying IMA measurement logs
Date: Thu, 18 Jun 2020 00:10:42 -0700
Message-Id: <20200618071045.471131-1-prsriva@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
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
Cc: kstewart@linuxfoundation.org, mark.rutland@arm.com, catalin.marinas@arm.com,
 bhsharma@redhat.com, tao.li@vivo.com, zohar@linux.ibm.com, paulus@samba.org,
 vincenzo.frascino@arm.com, frowand.list@gmail.com, nramas@linux.microsoft.com,
 masahiroy@kernel.org, jmorris@namei.org, takahiro.akashi@linaro.org,
 serge@hallyn.com, pasha.tatashin@soleen.com, will@kernel.org,
 prsriva@linux.microsoft.com, robh+dt@kernel.org, hsinyi@chromium.org,
 tusharsu@linux.microsoft.com, tglx@linutronix.de, allison@lohutok.net,
 christophe.leroy@c-s.fr, mbrugger@suse.com, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com, james.morse@arm.com, gregkh@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Integrgity Measurement Architecture(IMA) during kexec(kexec file load)
verifies the kernel signature and measures the signature of the kernel.

The signature in the measuremnt logs is used to verfiy the 
authenticity of the kernel in the subsequent kexec'd session, however in
the current implementation IMA measurement logs are not carried over thus
remote attesation cannot verify the signature of the running kernel.

Adding support to arm64 to carry over the IMA measurement logs over kexec.

Add a new chosen node entry linux,ima-kexec-buffer to hold the address and
the size of the memory reserved to carry the IMA measurement log.
Refactor existing powerpc code to be used by amr64 as well.  

Changelog:

v2:
  Break patches into separate patches.
  - Powerpc related Refactoring
  - Updating the docuemntation for chosen node
  - Updating arm64 to support IMA buffer pass

v1:
  Refactoring carrying over IMA measuremnet logs over Kexec. This patch
    moves the non-architecture specific code out of powerpc and adds to
    security/ima.(Suggested by Thiago)
  Add Documentation regarding the ima-kexec-buffer node in the chosen
    node documentation

v0:
  Add a layer of abstraction to use the memory reserved by device tree
    for ima buffer pass.
  Add support for ima buffer pass using reserved memory for arm64 kexec.
    Update the arch sepcific code path in kexec file load to store the
    ima buffer in the reserved memory. The same reserved memory is read
    on kexec or cold boot.

Prakhar Srivastava (3):
  Refactoring powerpc code for carrying over IMA measurement logs, to
    move non architecture specific code to security/ima.
  dt-bindings: chosen: Document ima-kexec-buffer carrying over IMA
    measuremnt logs over kexec.
  Add support for arm64 to carry over IMA measurement logs

 Documentation/devicetree/bindings/chosen.txt |  17 +++
 arch/arm64/Kconfig                           |   1 +
 arch/arm64/include/asm/ima.h                 |  17 +++
 arch/arm64/include/asm/kexec.h               |   3 +
 arch/arm64/kernel/machine_kexec_file.c       |  47 +++++--
 arch/powerpc/include/asm/ima.h               |  10 --
 arch/powerpc/kexec/ima.c                     | 126 ++-----------------
 security/integrity/ima/ima_kexec.c           | 116 +++++++++++++++++
 8 files changed, 201 insertions(+), 136 deletions(-)
 create mode 100644 arch/arm64/include/asm/ima.h

-- 
2.25.1

