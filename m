Return-Path: <linuxppc-dev+bounces-8625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB76ABA9E9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 May 2025 13:50:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b02MS6Cm1z305M;
	Sat, 17 May 2025 21:50:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747482644;
	cv=none; b=oHokPstuPkgvO9uTSA15uk06V5QAwtu2UhpzYaRJopsFdoUQN6GgTfvI7gvq+mC3NPbMwlwYSNmZpkIJPUNiIQHxOFQ+xdJx1WJQBhboYWJv5Pb9+OFal7qjfAvZskxapZPlpkzKtAUXRwzW31Lb4LWTzyHQOEUX964Tw8fHHXDbG2we3Tlo4JK5vnA52LQIVJsh5ffCm8GmBe2XoiaIdwcRBbfnV0y8XZ01+Ed7TspBdNgrwgakqgsnihwnEgqxmA4sZ31QvqBT50XPHyIdeMXe1cG7MjbxUVVQuh9X+nCQYssPWc2Ngz81vKMcpkb/2gEbNL/CyQ5HVoJORqT/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747482644; c=relaxed/relaxed;
	bh=m0QQUV73q7Cv4WFCmvYUT5PTGEo9iRFD24Qwu+JrYQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=idSgxpip19OI0Z5KAZfF2GwiaLo2fQ05IBhcOEG6MnuK0HndaepEp4uJxbmjuM8USLwwlmYV4q3vkdtjyaAvlB20OefsP4KihIB99eFBSB/dHEbZKk+Pg6oI5ti1Hom/Qq3UHhOvd/dCGzo5qmKder37q1nMAR+pgQj30YkrasDkbgY+2LObX8S4dPzH4kSz8f79Gk4aAl5nzrXD/eL+o1a9B7J6ylFGKJebA6c7VZzIWb/Kas+ckpVxnRL6GXsPMQKY1O2R5k0aiFSDJsPhV+h2R3aGjWKp33mEq6OC6z9wTBMew6njzl0P61SZ147yaYxyJjNYsiAGlC85gFB/Yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b02MS2c5rz2ysb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 21:50:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4b00ML269qz9sd1;
	Sat, 17 May 2025 12:20:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u_j-kwnIF3ju; Sat, 17 May 2025 12:20:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4b00ML1S3rz9scH;
	Sat, 17 May 2025 12:20:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C26F8B768;
	Sat, 17 May 2025 12:20:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id x8KOnfLvFbC2; Sat, 17 May 2025 12:20:30 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CD4468B767;
	Sat, 17 May 2025 12:20:29 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 54HAKL7u013343
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 May 2025 12:20:21 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 54HAKLua013342;
	Sat, 17 May 2025 12:20:21 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] bus: fsl-mc: Use strscpy() instead of strscpy_pad()
Date: Sat, 17 May 2025 12:19:40 +0200
Message-ID: <174747706461.12970.12407868094636158420.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250429104149.66334-1-thorsten.blum@linux.dev>
References: <20250429104149.66334-1-thorsten.blum@linux.dev>
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
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747477178; l=671; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=XARyMbMk0ocC0UV7ijn+e4ygQ6tnPtTPYUc6a6ZTFP0=; b=fkqCiXLFaISyXqz2xP4gHlZDKtyZDvfwuga56YIyOEnd0km5wkX/PCp9NOkV7Mx6YutdOhz/h PA8WrhPkw7zA0xZr/GdsY1tjFtS1EH2vVWIjvpac6rM2w7jHCLRReMH
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Tue, 29 Apr 2025 12:41:48 +0200, Thorsten Blum wrote:
> Both destination buffers are already zero-initialized, making strscpy()
> sufficient for safely copying 'obj_type'. The additional NUL-padding
> performed by strscpy_pad() is unnecessary.
> 
> If the destination buffer has a fixed length, strscpy() automatically
> determines its size using sizeof() when the argument is omitted. This
> makes the explicit size arguments unnecessary.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl-mc: Use strscpy() instead of strscpy_pad()
      commit: 61ddf5faa7cc091b409936d571ec1af34ce487a1

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

