Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2023A84F092
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 08:03:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b2CJvaUV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWPvb0DGVz3cZn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:03:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b2CJvaUV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWPt60p95z2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:02:05 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d7393de183so4742195ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 23:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707462123; x=1708066923; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eL749GGZxcw+dNDSidA1ZYGeUwGyyiY2EeTAJqo21lY=;
        b=b2CJvaUV4NehgZC2MmDnmJxu5HcwUSv1QFNURfooCGtnHD5F0F0qrEVRyiQ2tpoanR
         BSVT+yNEbpzzfH9lFJUX2rboPfmFdURUa3zpKnn+9vlLnwuqlszrpMu+asnAYhdg8lah
         BNK+Mbkr9624kuoCGJGQdzN0L3zzl5s594yxclTTZOx08aou4s8L5kJJPutn06RJs4/J
         86HyjCdykeT+tQYwqy6Vnqg6/fthsliyXWdD/aehjMh+PRuBzxnBd62ia8mN/gwsjdwX
         q4JEX1WL5DNb7gm8OiSZNVawIdmhQrqsW7XNeFBl9EGp+0lJtC/o6f8dKwQXxi1xGJcP
         3dYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707462123; x=1708066923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eL749GGZxcw+dNDSidA1ZYGeUwGyyiY2EeTAJqo21lY=;
        b=oz/BxFxpZ6P2nM1LN/tnHr3IxgSh4LOAMh6zhzltnTa1OZjdkqh4nKxio0xRPB0R/N
         YEIXiCT8Ef+cS0KY2mWtJQzBHqNpqr3h5G8Nzm62id8VTdR3zYp9W24QLmDuKw2qe5w9
         furnWE1YYIIC/wYbubq9e2qDhd6T1HNR/gW4sZr/1R5T2AeHVy3KyZrO802gEU6i/W6S
         8dWcPclvX7dJjuIOk2c1wf3NcmyjqXC2VUJdKWoJTFIpLcwGZTXPF20fyn8ukXQV5Cke
         lMKgCjKgIJ5ToAjr39o+Q3qLDrzERivsSIN1A2k0kL44Lka12XGE/NoRtQfUjkuuSFxh
         /3kA==
X-Forwarded-Encrypted: i=1; AJvYcCWnWn0t7yOZ27UwjbOMQq8QIedYazeH/Qv9J3kgk6xOEuaTPYQexMZTeftH3CixwseAisHXAXfhIV6e5BFA7w4zP0ch77Xv140TLmqlbg==
X-Gm-Message-State: AOJu0YyZ9C+CGS+Ar+iskFUWp3DtgBz8KMGKXVdX3zg3VITwakYZFcFk
	rWYRtV4SlFQUTXJ+tzDhQfkRmqFnE0yO8Q91Nr7h5WDiJ9BHKS6a
X-Google-Smtp-Source: AGHT+IEdJEZPg4RmRriNJvZ9ahIM21K97ubmmeCO1CKYdbqQsQThckXb2cLmncRYSvscNc6GGM/MAQ==
X-Received: by 2002:a17:90b:18b:b0:28d:1e1b:d73b with SMTP id t11-20020a17090b018b00b0028d1e1bd73bmr549771pjs.19.1707462123256;
        Thu, 08 Feb 2024 23:02:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXAx3a693s2l69Ut2KmKGU4vE2ZC23IXFwaBq60nxdhXQH/wHqINSDRVEggFL83Uw2MwTD9HerALBagZpD8L1eLx4n8TkjqzJ1EGYIMSlHivyd5ypAco80tPfYCz8Hhg34bjv7ya4IYE/HbC0AqAGovAva0WfT4DoOWsO6umPQ+WPMNMsSVVAV6YrXzPXUNjf46OwTbAN+E3I9XhudqgT3G42OFW05p0f0ADTIl6+x+6xpc+BkKnDEuLGaBB/BqUB2jz51hr6LLF3YkHFzD8NghbacfpFpqTB42Io0ldUdysrN7sPlP4VBANUXFnYvnXnoZsg3HXxn21bbqXtbw8r/hLfPNYHjcYLXHdwKUrha44NHYGWm9DIneZWOA5u1atuzSBY0CETd4h9+sxh1mG7owCB0o0+ZXnqlFbAOozjeWyXn9jMGm+jqBMUF7S5W4yc/bzY/sAz8xGDJrLGWUVSy2CPWb1PfsKmTPZNmUM95l6OTokRvOeYdBLQBzEFZzMCIypPS85Ja35rox/gu4ZJdSZ7xbfoYZk4+nYnsWLWrlcarZSyzAyZ9l
Received: from wheely.local0.net ([1.146.102.26])
        by smtp.gmail.com with ESMTPSA id r10-20020a170903410a00b001d7284b9461sm839285pld.128.2024.02.08.23.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 23:02:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v3 1/8] arch-run: Fix TRAP handler recursion to remove temporary files properly
Date: Fri,  9 Feb 2024 17:01:34 +1000
Message-ID: <20240209070141.421569-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209070141.421569-1-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
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

This also moves the trap handler before temp file creation, and expands
the name variables at trap-time rather than install-time, which closes
the small race between creation trap handler install.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index d0864360..11d47a85 100644
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

