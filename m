Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA485CEC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 04:29:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hlhcm3X+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfhbd0yGxz3dWQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 14:29:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hlhcm3X+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfhZ63znbz2yq4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 14:28:30 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d934c8f8f7so58386975ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 19:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708486108; x=1709090908; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evUoa/UNV/oB4oPRxAOsnBRrgjlX2PtlMy4jxi9Yd70=;
        b=hlhcm3X+FtJWeWERCGAyoCquvUUPPwqPBUEnDl89T/eMCFVesUo0aYV3wSIeTyHN2g
         CfnAyVOTzVLB4Rp4b0wjL5Uy/sxusV1pLN8n2sTRfYhdIAWg+oKGCk8zorahMu6s5ms1
         NayFuZVUfz2hM+dv/EPrIjnUAisgNmSgR83BxZqFhy68Va48cNMvCdGyfJA6Zn6kBut4
         PyR+V7uW6VFObJHH+zBW5ek87Xhi9bPBH93vVKPV5mdEN4Phd3f2wAfquamHYsOPsxAc
         I0MLyuADA2NXBuACPt1gaDzMGVK2OBSE9lum/ONj3CUJ95I/OTjnwVJ/+S05jHCPbnRE
         etdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486108; x=1709090908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evUoa/UNV/oB4oPRxAOsnBRrgjlX2PtlMy4jxi9Yd70=;
        b=Z1V9Hl/kFvZeVIna02sXF7myF9WaK4gG9HBTEwUppXKIt/KP+4KnF1dpcqXsiH8U4+
         kB5niUwQ+Aez2gRcfEaZaHaVIXvjqPfcHsGwMhfNG9pfNJUPzoTycb+oZMTZRTJB1mNx
         4BQbNdQKN76WBec+aLQTJ+I3WNAwiWN0YwYW4sW/Ph7Z4mlMoAsPPCNAd1oiDlxpAL0G
         d30p+hyKSGVAZoFbb9/HUExbzcDFZuhB6XubDRgx1KVxlbtFwpI3Ne1QOVk+iJq414VG
         7ub3WqK0yyUkCe6mXVYjsgILL0l/EiThW0sEwG0z2IPQcXy1t/+zh0S/tGWNaHohMQow
         GkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAm58QKSq7/aQp5zXBVq4R4mc+pOBZBPS2vtumULD+aG/ZGjZUybjQqW27VF3Tpf0Eb2cy65/C7bW/JZaM16+mDdvu06PIybCdtqLb+w==
X-Gm-Message-State: AOJu0YxS4iMvLNZeAlCVfLSEhLDFKKNuOCLnkUsatUwNGfieVmlc/4jY
	SrRSy5JEaoXVo3+RmuKlCXSdFEn2v7kQeWkn5hN02u0icagb6ZG9
X-Google-Smtp-Source: AGHT+IHLUAJXOt//4pQmY07Vj7IwKrIV54Fyb24iOQkYYZFJyUxY99z1JgYADhvTB6IxvrnEmb4LgA==
X-Received: by 2002:a17:902:6806:b0:1db:e7dc:302f with SMTP id h6-20020a170902680600b001dbe7dc302fmr6474108plk.17.1708486107833;
        Tue, 20 Feb 2024 19:28:27 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902b10700b001dc214f7353sm1246457plr.249.2024.02.20.19.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:28:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v5 1/8] arch-run: Fix TRAP handler recursion to remove temporary files properly
Date: Wed, 21 Feb 2024 13:27:50 +1000
Message-ID: <20240221032757.454524-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240221032757.454524-1-npiggin@gmail.com>
References: <20240221032757.454524-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Migration files were not being removed when the QEMU process is
interrupted (e.g., with ^C). This is becaus the SIGINT propagates to the
bash TRAP handler, which recursively TRAPs due to the 'kill 0' in the
handler. This eventually crashes bash.

This can be observed by interrupting a long-running test program that is
run with MIGRATION=yes, /tmp/mig-helper-* files remain afterwards.

Removing TRAP recursion solves this problem and allows the EXIT handler
to run and clean up the files.

This also moves the trap handler before temp file creation, which closes
the small race between creation trap handler install.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index d0864360a..11d47a85c 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -129,6 +129,9 @@ run_migration ()
 		return 77
 	fi
 
+	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
+	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
+
 	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
 	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
 	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
@@ -137,9 +140,6 @@ run_migration ()
 	qmpout1=/dev/null
 	qmpout2=/dev/null
 
-	trap 'kill 0; exit 2' INT TERM
-	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
-
 	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
 		-mon chardev=mon1,mode=control | tee ${migout1} &
 	live_pid=`jobs -l %+ | grep "eval" | awk '{print$2}'`
@@ -209,11 +209,11 @@ run_panic ()
 		return 77
 	fi
 
-	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
-
-	trap 'kill 0; exit 2' INT TERM
+	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
 	trap 'rm -f ${qmp}' RETURN EXIT
 
+	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
+
 	# start VM stopped so we don't miss any events
 	eval "$@" -chardev socket,id=mon1,path=${qmp},server=on,wait=off \
 		-mon chardev=mon1,mode=control -S &
-- 
2.42.0

